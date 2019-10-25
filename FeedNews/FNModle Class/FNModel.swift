//
//  PageTitle.swift
//  FeedNews
//
//  Created by keshavkumar on 23/10/19.
//  Copyright © 2019 keshavkumar. All rights reserved.
//

import Foundation
import UIKit

//https://www.nbcnewyork.com/apps/news-app/home/modules/?apiVersion=18&os=ios

struct EachItem: Decodable  {
    var title: String
    var thumbnailImageURL: String
    var summary: String
}

struct Modules: Decodable {
    var items: [EachItem]
    var pageTitle: String
}

struct HomeData: Decodable {
    var modules: [Modules]
}


