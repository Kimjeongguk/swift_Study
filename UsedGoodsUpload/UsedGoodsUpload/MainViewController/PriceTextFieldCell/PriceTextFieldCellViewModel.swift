//
//  PriceTextFieldCellViewModel.swift
//  UsedGoodsUpload
//
//  Created by jeongguk on 2023/10/24.
//

import RxCocoa
import RxSwift

struct PriceTextFieldCellViewModel {
    //ViewModel -> View
    let showFreeShareShareButton: Signal<Bool>
    let resetPrice: Signal<Void>
    
    //View -> ViewModel
    let priceValue = PublishRelay<String?>()
    let freeShareButtonTapped = PublishRelay<Void>()
    
    init() {
        self.showFreeShareShareButton = Observable
            .merge(
                priceValue.map { $0 ?? "" == "0"},
                freeShareButtonTapped.map { _ in false }
            )
            .asSignal(onErrorJustReturn: false)
        
        self.resetPrice = freeShareButtonTapped
            .asSignal(onErrorSignalWith: .empty())
    }
}
