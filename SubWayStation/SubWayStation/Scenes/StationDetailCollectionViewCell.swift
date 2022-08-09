//
//  StationDetailCollectionViewCell.swift
//  SubWayStation
//
//  Created by jeongguk on 2022/08/09.
//

import SnapKit
import UIKit

final class StationDetailCollectionViewCell: UICollectionViewCell {
    private lazy var lineLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .bold)
        
        return label
    }()
    
    private lazy var remainTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .bold)
        
        return label
    }()
    
    func setup(){
        layer.cornerRadius = 12.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 10
        
        backgroundColor = .systemBackground
        [lineLabel, remainTimeLabel].forEach {
            addSubview($0)
        }
        lineLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().inset(16.0)
        }
        
        remainTimeLabel.snp.makeConstraints {
            $0.leading.equalTo(lineLabel)
            $0.top.equalTo(lineLabel.snp.bottom).offset(16.0)
            $0.bottom.equalToSuperview().inset(16.0)
        }
        
        lineLabel.text = "한양대 방면"
        remainTimeLabel.text = "뚝섬 도착"
    }
}
