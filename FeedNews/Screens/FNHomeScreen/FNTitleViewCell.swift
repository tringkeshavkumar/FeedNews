//
//  FNTitleViewCell.swift
//  FeedNews
//
//  Created by keshavkumar on 29/11/19.
//  Copyright © 2019 keshavkumar. All rights reserved.
//

import UIKit

class FNTitleViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
   
    var cellViewModel: FNTitleViewModel? = nil
    
    func configureCell() {
        title.text = cellViewModel?.title
    }
}
