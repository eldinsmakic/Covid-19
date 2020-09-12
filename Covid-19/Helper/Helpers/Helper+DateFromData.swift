//
//  Helper+DateFromData.swift
//  Covid-19
//
//  Created by eldin smakic on 12/09/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import Foundation

extension Helper {

    public struct DateFromData {

        static func getDate() -> Date
        {
            return Date()
        }

        static func dateToString(date: Date) -> String
        {
            return ISO8601DateFormatter().string(from: date)
        }

        static func stringToDate(strDate: String) -> Date?
        {
            return ISO8601DateFormatter().date(from: strDate)
        }

        static var dateFormater: DateFormatter = {
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "yyyy-MM-dd"

            return dateFormater
        }()
    }
}
