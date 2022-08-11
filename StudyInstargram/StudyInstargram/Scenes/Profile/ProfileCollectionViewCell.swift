//
//  ProfileCollectionViewCell.swift
//  StudyInstargram
//
//  Created by Jeongguk Kim on 2022/08/11.
//

import UIKit
import SnapKit

final class ProfileCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()

    func setup(with image: UIImage) {
        addSubview(imageView)
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }

        imageView.backgroundColor = .tertiaryLabel
    }
}
