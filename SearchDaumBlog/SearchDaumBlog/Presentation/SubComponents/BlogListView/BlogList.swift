//
//  BlogList.swift
//  SearchDaumBlog
//
//  Created by jeongguk on 2023/08/18.
//

import RxSwift
import RxCocoa
import UIKit

class BloagListView: UITableView {
    let disposBag = DisposeBag()
    
    let headerView = FilterView(
        frame: CGRect(
            origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: 50)
        )
    )
    
    let cellData = PublishSubject<[BlogListCellData]>()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        bind()
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        cellData
            .asDriver(onErrorJustReturn: [])
            .drive(self.rx.items) { tv, row, data in
                let index = IndexPath(row: row, section: 0)
                let cell = tv.dequeueReusableCell(withIdentifier: "BlogListCell", for: index) as! BlogListCell
                cell.setData(data)
                return cell
            }
            .disposed(by: disposBag)
        
    }
    
    private func attribute() {
        self.backgroundColor = .white
        self.register(BlogListCell.self, forCellReuseIdentifier: "BlogListCell")
        self.separatorStyle = .singleLine
        self.rowHeight = 100
        self.tableHeaderView = headerView
    }
}
