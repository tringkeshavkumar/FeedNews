//
//  HttpAsyncService.swift
//  FeedNews
//
//  Created by keshavkumar on 23/10/19.
//  Copyright © 2019 keshavkumar. All rights reserved.
//

import Foundation
struct Animal: Decodable {
    let name: String
    let description: String
    let maxWeightInLbs: Int
    
    private enum CodingKeys: String, CodingKey {
        case name
        case description
        case maxWeightInLbs = "max_weight_lbs"
    }
}

class FNHttpAsyncService {
 
    enum DataError: Error {
        case invalidData
        case invalidResponse
        case decodingError
        case serverError
    }
    
    typealias result<T> = (Result<T,Error>) -> Void
    
    static func getData<T:Decodable> (url: URL, modeltype: T.Type, completionHandler: @escaping result<T> ) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                completionHandler(.failure(DataError.serverError))
            }
            
            guard let urlData = data else {
                completionHandler(.failure(DataError.invalidData))
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(modeltype, from: urlData)
                completionHandler(.success(decodedData))
            }
            catch {
                completionHandler(.failure(DataError.decodingError))
            }
        }.resume()
    }

}
