//
//  DataResponseDTO.swift
//  Covid-19
//
//  Created by eldin smakic on 11/08/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import Foundation

public struct DataResponseDTO: Decodable
{
    public let date: String?
    public let totalCases: Double?
    public let newCases: Double?
    public let totalDeaths: Double?
    public let newDeaths: Double?
    public let totalCasesPerMillion: Double?
    public let newCasesPerMillion: Double?
    public let totalDeathsPerMillion: Double?
    public let newDeathsPerMillion: Double?
}
