//
//  FNTitleViewModel.swift
//  FeedNews
//
//  Created by keshavkumar on 02/12/19.
//  Copyright © 2019 keshavkumar. All rights reserved.
//

import Foundation


class FNTitleViewModel: NSObject {
    
    var modules: HomeData.Modules? = nil
    
    var title: String {
        return "\(modules?.pageTitle ?? "")"
    }
}
