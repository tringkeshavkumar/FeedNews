//
//  FNHomeViewModel.swift
//  FeedNews
//
//  Created by keshavkumar on 02/12/19.
//  Copyright © 2019 keshavkumar. All rights reserved.
//

import Foundation

class FNHomeViewModel: NSObject {
    
    private var homeModel : HomeData?
    var errorMessage: String?
    var moduleList: [HomeData.Modules] {
        return homeModel?.modules ?? []
    }
    
    /*
     Fetch home API data
     */
    func getApiData(completion:@escaping ((HomeData?) -> ())) {
        
        guard let homeUrl:URL = URL(string: homeApi) else {
            self.errorMessage = "URL Wrong"
            completion(nil)
            return
        }
         
        FNHttpAsyncService.getData(homeUrl, HomeData.self) {
            
            [weak self] (result) in
            
            guard let weakself = self else {
                return
            }
            
            switch result {
                
            case .success(let homeData):
                weakself.homeModel = homeData
                completion(homeData)
                
            case .failure(let error):
                weakself.errorMessage = error.localizedDescription
                completion(nil)
            }
        }
    }
}


