//
//  DataManager.swift
//  Covid-19
//
//  Created by eldin smakic on 22/05/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import Foundation
import RxSwift

struct DataCovid: Decodable
{
    let date: Date
    let country: String
    let caseUpdate: CaseUpdate
}

/// Manage data from Covid-19
/// will fetch data and return an observable
protocol DataManager
{
    /// Return data with an observable
    func getData(country: String, date: Date) -> Observable<[DataCovid]>
   
}
