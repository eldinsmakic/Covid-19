//
//  TodaysDateService.swift
//  Covid-19
//
//  Created by eldin smakic on 21/05/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import Foundation
import RxSwift

class TodaysDateService
{

    func getDate() -> Date
    {
        return Date.init()
    }

    func dateToString(date: Date) -> String
    {
        return ISO8601DateFormatter().string(from: date)
    }

    func stringToDate(strDate: String) -> Date?
    {
        return ISO8601DateFormatter().date(from: strDate)
    }

}
