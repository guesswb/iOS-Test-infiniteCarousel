//
//  CollectionViewCell.swift
//  Ranker
//
//  Created by 김기훈 on 2023/03/29.
//

import UIKit

import SnapKit
import Then

final class CollectionViewCell: UICollectionViewCell {
    
    var titleLabel: UILabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 30)
    }
    
    var subLabel: UILabel = UILabel().then {
        $0.textAlignment = .center
    }
    
    private let checkContentLabel: UILabel = UILabel().then {
        $0.text = "관련 뉴스 >"
    }
    
    var contentLabel: UILabel = UILabel().then {
        $0.numberOfLines = 7
        $0.isHidden = true
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

extension CollectionViewCell {
    private func configureUI() {
        backgroundColor = .brown
        
        addViews()
        configureLayout()
    }
    
    private func addViews() {
        addSubview(titleLabel)
        addSubview(subLabel)
        addSubview(checkContentLabel)
        addSubview(contentLabel)
    }
    
    private func configureLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().multipliedBy(0.4)
        }
        
        subLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().multipliedBy(0.6)
        }
        
        checkContentLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().multipliedBy(0.9)
        }
        
        contentLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.9)
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
    
    func buttonClicked() {
        titleLabel.isHidden.toggle()
        subLabel.isHidden.toggle()
        checkContentLabel.isHidden.toggle()
        contentLabel.isHidden.toggle()
        
        UIView.transition(with: self, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
    }
}
