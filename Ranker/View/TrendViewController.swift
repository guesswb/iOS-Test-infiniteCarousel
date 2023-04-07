//
//  TrendViewController.swift
//  Ranker
//
//  Created by 김기훈 on 2023/03/28.
//

import UIKit

final class TrendViewController: UIViewController {
    
    private var trendView: TrendView!
    
    override func loadView() {
        trendView = TrendView()
        view = trendView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        trendView.collectionView.setContentOffset(CGPoint(x: 3200, y: trendView.collectionView.contentOffset.y), animated: false)
    }
}
