//
//  HttpAsyncService.swift
//  FeedNews
//
//  Created by keshavkumar on 23/10/19.
//  Copyright © 2019 keshavkumar. All rights reserved.
//

import Foundation

class FNHttpAsyncService {
 
    enum DataError: Error {
        case invalidData
        case invalidResponse
        case decodingError
        case serverError
    }
    
    typealias result<T> = (Result<T,Error>) -> Void
    
    static func getData<T:Decodable> (_ url: URL,_ modeltype: T.Type, completionHandler: @escaping result<T> ) {
        
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
