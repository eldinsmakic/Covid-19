//
//  CaseUpdateModel.swift
//  Covid-19
//
//  Created by eldin smakic on 21/05/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import Foundation

struct CaseUpdate: Decodable
{
    let newDeaths: Double
    let newInfecteds: Double
    let newRecovereds: Double
    let totalDeaths: Double
    let totalInfecteds: Double
    let totalRecovereds: Double
}
