//
//  DetailWriteFormCellViewModel.swift
//  UsedGoodsUpload
//
//  Created by jeongguk on 2023/10/24.
//

import RxCocoa
import RxSwift

struct DetailWriteFormCellViewModel {
    //View -> ViewModel
    let contentValue = PublishRelay<String?>()
}
