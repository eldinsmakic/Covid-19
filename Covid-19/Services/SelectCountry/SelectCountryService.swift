//
//  SelectCountry.swift
//  Covid-19
//
//  Created by eldin smakic on 25/05/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import Foundation
import RxSwift

class SelectCountryService
{
    var country = ""

    func getCountrySelected() -> Observable<String>
    {
        return Observable.create { observer -> Disposable in
            if self.country != ""
            {
                observer.onNext(self.country)
            }
            return Disposables.create { }
        }
    }

    func fireCountrySelected(country: String)
    {
        self.country = country
    }
}
