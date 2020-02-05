//
//  PageTitle.swift
//  FeedNews
//
//  Created by keshavkumar on 23/10/19.
//  Copyright © 2019 keshavkumar. All rights reserved.
//

import Foundation

struct HomeData: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case modules
    }
    let modules: [Modules]?
    
    struct Modules: Decodable {
        
        enum CodingKeys: String, CodingKey {
            case items
            case pageTitle
            case location
        }
        
        let items: [EachItem]?
        let pageTitle: String?
        let location: String?
        
        struct EachItem: Decodable  {
            
            enum CodingKeys: String, CodingKey {
                case title
                case thumbnailImageURL
                case summary
            }
            let title: String?
            let thumbnailImageURL: String?
            let summary: String?
        }
    }
    
}


