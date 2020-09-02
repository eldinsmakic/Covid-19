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
    let infected: Int
    let recovered: Int
    let death: Int
}
