//
//  OwidDataManager.swift
//  Covid-19
//
//  Created by eldin smakic on 11/08/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public class OwidDataManager: ObservableObject {

    let urlString = "https://covid.ourworldindata.org/data/owid-covid-data.json"
    let caseUpdateBuilder = CaseUpdateFactory()

    var datas: [String: CovidResponseDTO]

    @Published var dataIsLoaded = false
    @Published var dataCovid: DataCovid?

    init() {
        self.datas = [:]
        self.dataCovid = nil

    }

    func loadData() -> AnyPublisher<[String: CovidResponseDTO], Error> {
        return URLSession.shared.dataTaskPublisher(for: URL(string: urlString)!)
            .map(\.data)
            .decode(type: [String: CovidResponseDTO].self, decoder: Helper.DataFromJson.jsonDecoder)
            .eraseToAnyPublisher()
    }

    func loadLocalData() {
        guard let localdatas = Helper.DataFromJson.getData(fromJson: "localData", withDataType: [String: CovidResponseDTO].self) else { return }
        datas = localdatas
        dataIsLoaded = true
    }

    func getData(fromCountry country: String, at date: Date) {
        guard let country = converterToISO(fromCountry: country) else { return }

        let dataFromCountry = datas[country]

        if let data = dataFromCountry?.data? .first(where: { isSameDate(data: $0.date!, inSameDaysAs: date) }) {
            self.dataCovid = DataCovid(
               date: date,
               country: country,
                caseUpdate: caseUpdateBuilder.build(fromData: data))
        } else {
            guard let data = dataFromCountry?.data?.last else {
                print("HHH ERROR no new data for country \(country)")
                return
            }

            let dataDate = Helper.DateFromData.dateFormater.date(from: data.date!)!

            self.dataCovid = DataCovid(
                date: dataDate,
            country: country,
            caseUpdate: caseUpdateBuilder.build(fromData: data))
        }
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
