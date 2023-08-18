//
//  AlertActionConvertible.swift
//  SearchDaumBlog
//
//  Created by jeongguk on 2023/08/18.
//

import UIKit

protocol AlertActionConvertible {
    var title: String { get }
    var style: UIAlertAction.Style { get }
}
