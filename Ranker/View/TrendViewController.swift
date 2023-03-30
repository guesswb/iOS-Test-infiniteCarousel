//
//  TrendViewController.swift
//  Ranker
//
//  Created by 김기훈 on 2023/03/28.
//

import UIKit

final class TrendViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    
    private let cellIdentifier: String = "trendViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureLayout()
        
        setUpCollectionViewDelegate()
    }
}

extension TrendViewController {
    private func configureUI() {
        collectionView = createCollectionView()
        self.view.addSubview(collectionView)
    }
    
    private func configureLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.snp.bottom).multipliedBy(0.15)
            $0.bottom.equalTo(view.snp.bottom).multipliedBy(0.8)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
    }
    
    private func setUpCollectionViewDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(TrendViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func createCollectionView() -> UICollectionView {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: creatrCollectionViewFlowLayout())
        
        return cv
    }
    
    private func creatrCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()

        layout.sectionInset = UIEdgeInsets(top: 5.0, left: 0, bottom: 5.0, right: 0)
        layout.scrollDirection = .vertical
        
        return layout
    }
}

extension TrendViewController: UICollectionViewDelegate {
}

extension TrendViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width * 0.8, height: collectionView.bounds.width * 0.2)
    }
}

extension TrendViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? TrendViewCell else {
            return TrendViewCell()
        }
        
        cell.wordLabel.text = "3333"
        
        return cell
    }
}
