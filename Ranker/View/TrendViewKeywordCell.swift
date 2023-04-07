//
//  TrendViewResultCell.swift
//  Ranker
//
//  Created by 김기훈 on 2023/03/29.
//

import UIKit

import SnapKit
import Then

final class TrendViewKeywordCell: UICollectionViewCell {
    
    var wordLabel: UILabel = UILabel().then {
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TrendViewKeywordCell {
    private func configureUI() {
        backgroundColor = .brown
        
        addViews()
        configureLayout()
    }
    
    private func addViews() {
        addSubview(wordLabel)
    }
    
    private func configureLayout() {
        wordLabel.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func transformToLarge() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
    }
    
    func transformToStandard() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform.identity
        }
    }
    
//    private func buttonClicked() {
//           if isReversed {
//               isReversed = false
//               UIView.transition(with: UIView(), duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
//           } else {
//               isReversed = true
//               UIView.transition(with: UIView(), duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
//           }
//       }
}
