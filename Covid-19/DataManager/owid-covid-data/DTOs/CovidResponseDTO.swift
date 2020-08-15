//
//  CovidResponseDTO.swift
//  Covid-19
//
//  Created by eldin smakic on 11/08/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

public struct CovidResponseDTO: Decodable
{
    public let continent: String
    public let location: String
    public let population: Double
    public let populationDensity: Double
    public let data: [DataResponseDTO]
}
