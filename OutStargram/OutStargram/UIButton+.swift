//
//  UIButton+.swift
//  OutStargram
//
//  Created by Jeongguk Kim on 2023/06/18.
//

import UIKit


extension UIButton {
    func setImage(systemName: String) {
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        
        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = .zero
        
        setImage(UIImage(systemName: systemName), for: .normal)
        
    }
}
