//
//  DataFromJson.swift
//  Covid-19
//
//  Created by eldin smakic on 12/09/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import Foundation

extension Helper {

    public struct DataFromJson {

        static func getData<T: Decodable>(fromJson json: String, withDataType type: T.Type ) -> T? {
            return getData(fromJson: json, withDataType: type, decodedBy: self.jsonDecoder)
        }

        static func getData<T: Decodable>(fromJson json: String, withDataType type: T.Type, decodedBy decoder: JSONDecoder) -> T? {
            guard let url = Bundle.main.url(forResource: json, withExtension: "json")  else { return nil}

            do {
                let data = try Data(contentsOf: url)

               return try decoder.decode(T.self, from: data)

            } catch let error
            {
                print("HHH \(error)")
                return nil
            }
        }

        static var jsonDecoder: JSONDecoder = {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

            return jsonDecoder
        }()
    }
}
