//
//  OwidDataManager.swift
//  Covid-19
//
//  Created by eldin smakic on 11/08/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

public class OwidDataManager {

    var datas: [String: CovidResponseDTO]
    var dataCovid: DataCovid?
    let urlString = "https://covid.ourworldindata.org/data/owid-covid-data.json"

    init() {
        self.datas = [:]
        self.dataCovid = nil

        let jsonDecoder  = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

        AF.request(urlString)
            .responseData { response in
                switch response.result {
                case .success:
                    do {
                        
                        self.postDataIsReady()
                    } catch {
                    }
                case .failure:
                    self.datas = [:]
                    print("HHH Not working")
               }
        }
    }

    func postDataIsReady()
    {
       let name = Notification.Name(rawValue: dataReady)
       NotificationCenter.default.post(name: name, object: nil)
    }

    func getData(fromCountry country: String, at date: Date) {
        guard let country = converterToISO(fromCountry: country) else { return }

        let dataFromCountry = datas[country]
        guard let data = dataFromCountry?.data.first(where: { isSameDate(data: $0.date, inSameDaysAs: date) }) else { return }

        self.dataCovid = DataCovid(
            date: date,
            country: country,
            caseUpdate: CaseUpdate(infected: Int(data.totalCases), recovered: 0, death: Int(data.newDeaths )))
        self.postDataIsReady()
    }

    private func converterToISO(fromCountry country: String) -> String? {
        return dictIsoToCountry[country]
    }

    private func convertToDate(fromString string: String ) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        return dateFormatter.date(from: string)
    }

    private func isSameDate(date1: Date, date2: Date) -> Bool {
       return  Calendar.current.isDate(date1, inSameDayAs: date2)
    }

    private func isSameDate(data: String, inSameDaysAs date: Date) -> Bool {
        if let dateFromData = convertToDate(fromString: data) {
            return isSameDate(date1: dateFromData, date2: date)
        } else {
            return false
        }
    }

    private lazy var dictIsoToCountry: [String: String] = {
        var dict: [String: String] = [:]
        for data in self.datas {
            dict[data.value.location] = data.key
            print("HHH \(data.key)")
        }
        return dict
    }()
}
