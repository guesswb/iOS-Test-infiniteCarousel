//
//  ViewController.swift
//  Ranker
//
//  Created by 김기훈 on 2023/03/28.
//

import UIKit

final class ViewController: UIViewController {
    
    private var trendView: CollectionView = CollectionView()
    
    override func loadView() {
        view = trendView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        trendView.collectionView.setContentOffset(CGPoint(x: 640, y: trendView.collectionView.contentOffset.y), animated: false)
    }
}
