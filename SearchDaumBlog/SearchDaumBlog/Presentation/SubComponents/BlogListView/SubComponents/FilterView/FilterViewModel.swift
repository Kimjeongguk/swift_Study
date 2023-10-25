//
//  FilterViewModel.swift
//  SearchDaumBlog
//
//  Created by jeongguk on 2023/10/17.
//

import RxSwift
import RxCocoa

struct FilterViewModel {
    let sortButtonTapped = PublishRelay<Void>()
}
