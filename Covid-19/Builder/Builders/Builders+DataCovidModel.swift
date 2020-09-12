//
//  Builders+DataCovidModel.swift
//  Covid-19
//
//  Created by eldin smakic on 12/09/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import Foundation

extension Builder {

    public class DataCovidFactory
    {

        static var builder = DataCovidFactory()

        func build(fromData data: DataResponseDTO, withCountry country: String, onDate date: Date) -> DataCovid {

            return DataCovid(
                date: date,
                country: country,
                caseUpdate: Builder.CaseUpdateFactory.builder.build(fromData: data)
            )
        }
    }
}
