//
//  TrendViewCell.swift
//  Ranker
//
//  Created by 김기훈 on 2023/03/29.
//

import UIKit

import SnapKit
import Then

final class TrendViewCell: UICollectionViewCell {
    
    var wordLabel: UILabel = UILabel().then {
        $0.backgroundColor = .brown
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

extension TrendViewCell {
    private func configureUI() {
        addSubview(wordLabel)
    }
    
    private func configureLayout() {
        wordLabel.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
