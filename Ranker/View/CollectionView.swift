//
//  CollectionView.swift
//  Ranker
//
//  Created by 김기훈 on 2023/04/07.
//

import UIKit

import SnapKit
import Then

final class CollectionView: UIView {
    
    let testData = ["9", "10", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "1", "2"]
    
    enum Cell {
        static let cellIdentifier = "trendViewCell"
        static let width = 300.0
        static let height = 300.0
        static let lineSpacing = 20.0
    }
    
    private lazy var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = Cell.lineSpacing
        $0.itemSize = CGSize(width: Cell.width, height: Cell.height)
    }
    
    lazy var collectionView: UICollectionView = UICollectionView(frame: .zero,
                                                                 collectionViewLayout: flowLayout)
        .then {
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .systemBackground
            $0.decelerationRate = .fast
            $0.delegate = self
            $0.dataSource = self
            $0.register(CollectionViewCell.self, forCellWithReuseIdentifier: Cell.cellIdentifier)
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionView {
    private func configureUI() {
        self.backgroundColor = .systemBackground
        
        addViews()
        configureLayout()
    }
    
    private func addViews() {
        self.addSubview(collectionView)
    }
    
    private func configureLayout() {
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(400)
        }
    }
}

extension CollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell else { return }
        cell.buttonClicked()
    }
}

extension CollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.cellIdentifier, for: indexPath) as? CollectionViewCell else {
            return CollectionViewCell()
        }
        
        cell.titleLabel.text = testData[indexPath.row]
        cell.subLabel.text = testData[indexPath.row]
        cell.layer.cornerRadius = 40
        
        return cell
    }
}

extension CollectionView: UICollectionViewDelegateFlowLayout {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let cellWidth = Cell.width + Cell.lineSpacing
        let currentOffset = scrollView.contentOffset.x
        let targetOffset = targetContentOffset.pointee.x
        let newTargetOffset: CGFloat = targetOffset > currentOffset ? ceil(currentOffset / cellWidth) * cellWidth : floor(currentOffset / cellWidth) * cellWidth
        
        targetContentOffset.pointee = CGPoint(x: newTargetOffset, y: targetContentOffset.pointee.y)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let firstOffsetX = (Cell.width + Cell.lineSpacing) * 2
        let lastOffsetX = (Cell.width + Cell.lineSpacing) * (Double(testData.count) - 3)
        
        if scrollView.contentOffset.x <= firstOffsetX - 320 {
            scrollView.setContentOffset(CGPoint(x: lastOffsetX, y: scrollView.contentOffset.y), animated: false)
        } else if scrollView.contentOffset.x >= lastOffsetX + 320 {
            scrollView.setContentOffset(CGPoint(x: firstOffsetX, y: scrollView.contentOffset.y), animated: false)
        }
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let insetX = (collectionView.frame.width - Cell.width) / 2
        return UIEdgeInsets(top: 0, left: insetX, bottom: 0, right: insetX)
    }
}
