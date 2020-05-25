//
//  FakeLocalDataManager.swift
//  Covid-19
//
//  Created by eldin smakic on 22/05/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import Foundation
import RxSwift
import AwaitKit
import PromiseKit

class FakeLocalDataManager : DataManager
{
    
    func getDatas(country: String, date: Date) -> CaseUpdate?
    {
        var result: CaseUpdate? = nil
        let datas = try! await(self.fetchData())
        for data in datas
        {
            if  Calendar.current.isDate(date, inSameDayAs: data.date)
            {
                if country == data.country
                {
                    result = data.caseUpdate
                    break
                }
                 
            }
        }
        return result
    }
    
    
    func getAllCuntry(date: Date) -> [String]
    {
        var result: [String] = []
        let datas = try! await(self.fetchData())
        for data in datas
        {
            if  Calendar.current.isDate(date, inSameDayAs: data.date)
            {
                result.append(data.country)
            }
        }
        return result
    }
    
    
    func getData(country: String, date: Date) -> Observable<[DataCovid]>
    {
        return Observable.create { observer -> Disposable in
                guard let path = Bundle.main.path(forResource: "DataManager/FakeData", ofType: "json")
                else {
                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                    return Disposables.create { }
                }
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder =  JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let dataCovids = try decoder.decode([DataCovid].self, from: data)
                observer.onNext(dataCovids)
                
            } catch let error as NSError{
                observer.onError(error)
            }
                
              return Disposables.create { }
        }
        
    }
    
    private func fetchData() -> Promise<[DataCovid]>
    {
        return Promise<[DataCovid]>
            {
                seal in
                guard let path = Bundle.main.path(forResource: "DataManager/FakeData", ofType: "json")
                else{
                        seal.reject(NSError(domain: "", code: -1, userInfo: nil))
                        return
                    }
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let decoder =  JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let dataCovids = try decoder.decode([DataCovid].self, from: data)
                    seal.fulfill(dataCovids)
                    
                } catch let error as NSError{
                    seal.reject(error)
                }
        }
    }
    
    
    

}
