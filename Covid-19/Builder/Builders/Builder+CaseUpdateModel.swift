//
//  Builder+CaseUpdateModel.swift
//  Covid-19
//
//  Created by eldin smakic on 12/09/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

extension Builder {

    public class CaseUpdateFactory
    {

        static var builder = CaseUpdateFactory()

        func build(fromData data: DataResponseDTO) -> CaseUpdate {
            return CaseUpdate(
                newDeaths: data.newDeaths ?? 0,
                newInfecteds: data.newCases ?? 0,
                newRecovereds: 0,
                totalDeaths: data.totalDeaths ?? 0,
                totalInfecteds: data.totalCases ?? 0,
                totalRecovereds: 0)
        }
    }
}
