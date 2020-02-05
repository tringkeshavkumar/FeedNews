//
//  ViewController.swift
//  FeedNews
//
//  Created by keshavkumar on 21/10/19.
//  Copyright © 2019 keshavkumar. All rights reserved.
//

import UIKit

class FNHomeViewController: UIViewController {
    
    var homedata_ = [HomeData]()
    var titles_ = [String]()
    var viewModel = FNHomeViewModel()
    let KtitleCellIdentifier = "titleCellId"
    
    @IBOutlet weak var titleCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          fetchData()
    }
    
    private func fetchData() {
        viewModel.getApiData { [weak self] (data) in
            guard let weakSelf = self else {
                return
            }
            
            DispatchQueue.main.async {
                if data == nil {
                    print(weakSelf.viewModel.errorMessage?.description ?? "Data error")
                }
                weakSelf.titleCollectionView.reloadData()
            }
        }
    }
    
}

extension FNHomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.moduleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KtitleCellIdentifier, for: indexPath) as? FNTitleViewCell else {
            return UICollectionViewCell()
        }
        
        cell.cellViewModel = FNTitleViewModel()
        cell.cellViewModel?.modules = viewModel.moduleList[indexPath.row]
        cell.configureCell()
        return cell
    }
    
}

extension FNHomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height / 14)
    }
}
