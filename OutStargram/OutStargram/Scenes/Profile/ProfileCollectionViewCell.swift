//
//  ProfileCollectionViewCell.swift
//  OutStargram
//
//  Created by Jeongguk Kim on 2023/06/25.
//

import UIKit
import SnapKit

final class ProfileCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    
    func setup(with image: UIImage) {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.backgroundColor = .tertiaryLabel
    }
}
