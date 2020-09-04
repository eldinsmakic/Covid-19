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
import SwiftUI
import Combine

public class OwidDataManager: ObservableObject {

    var datas: [String: CovidResponseDTO]
    @Published var dataIsLoaded = false
    @Published var dataCovid: DataCovid?

    let urlString = "https://covid.ourworldindata.org/data/owid-covid-data.json"

    init() {
        self.datas = [:]
        self.dataCovid = nil

    }

    func loadData() -> AnyPublisher<[String: CovidResponseDTO], Error> {
        let jsonDecoder  = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

        return URLSession.shared.dataTaskPublisher(for: URL(string: urlString)!)
            .map(\.data)
            .decode(type: [String: CovidResponseDTO].self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }

    func loadLocalData() {
        guard let url = Bundle.main.url(forResource: "localData", withExtension: "json")  else { return }

        do {
            let data = try Data(contentsOf: url)

            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            datas = try jsonDecoder.decode([String: CovidResponseDTO].self, from: data)
            dataIsLoaded = true
        } catch let error
        {
            print("HHH \(error)")
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

        if let data = dataFromCountry?.data? .first(where: { isSameDate(data: $0.date!, inSameDaysAs: date) }) {
            self.dataCovid = DataCovid(
               date: date,
               country: country,
               caseUpdate: CaseUpdate(infected: Int(data.totalCases!), recovered: 0, death: Int(data.totalDeaths! )))
        } else {
            guard let data = dataFromCountry?.data?.last else {
                print("HHH ERROR no new data for country \(country)")
                return
            }
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "yyyy-MM-dd"

            let dataDate = dateFormater.date(from: data.date!)!

            self.dataCovid = DataCovid(
                date: dataDate,
            country: country,
            caseUpdate: CaseUpdate(infected: Int(data.totalCases!), recovered: 0, death: Int(data.totalDeaths! )))
        }

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

    public lazy var dictIsoToCountry: [String: String] = {
        var dict: [String: String] = [:]
        for data in self.datas {
            if let location = data.value.location {
                dict[location] = data.key
            }
        }
        return dict
    }()
}
