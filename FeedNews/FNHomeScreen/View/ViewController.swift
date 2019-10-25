//
//  ViewController.swift
//  FeedNews
//
//  Created by keshavkumar on 21/10/19.
//  Copyright © 2019 keshavkumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.nbcnewyork.com/apps/news-app/home/modules/?apiVersion=18&os=ios")!
        
        FNHttpAsyncService.getData(url: url, modeltype: HomeData.self) { (result) in
            switch result {
                
            case .success(let homeData):
                for modules in homeData.modules {
                    print(modules.pageTitle)
                }
               
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
}

