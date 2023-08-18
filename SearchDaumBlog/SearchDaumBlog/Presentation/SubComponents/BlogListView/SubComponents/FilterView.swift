//
//  FilterView.swift
//  SearchDaumBlog
//
//  Created by jeongguk on 2023/08/18.
//

import RxSwift
import RxCocoa
import UIKit
import SnapKit

class FilterView: UITableViewHeaderFooterView {
    let disposeBag = DisposeBag()
    
    let sortButton = UIButton()
    let bottomBorder = UIView()
    
    let sortButtonTapped = PublishRelay<Void>()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        bind()
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        sortButton.rx.tap
            .bind(to: sortButtonTapped)
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        sortButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        bottomBorder.backgroundColor = .lightGray
    }
    
    private func layout() {
        [sortButton, bottomBorder]
            .forEach {
                addSubview($0)
            }
        
        sortButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().inset(12)
            make.width.height.equalTo(28)
        }
        
        bottomBorder.snp.makeConstraints { make in
            make.top.equalTo(sortButton.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    
    
}
