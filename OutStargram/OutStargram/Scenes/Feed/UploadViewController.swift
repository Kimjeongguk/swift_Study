//
//  UploadViewController.swift
//  OutStargram
//
//  Created by Jeongguk Kim on 2023/06/25.
//

import UIKit
import SnapKit

final class UploadViewcontroller: UIViewController {
    private let uploadImage: UIImage
    private let imageView = UIImageView()
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15.0)
        textView.text = "문구 입력..."
        textView.textColor = .secondaryLabel
        textView.font = .systemFont(ofSize: 15.0)
        textView.delegate = self
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        self.setupNavigationItem()
        self.setupLayout()
        
        imageView.image = uploadImage
    }
    
    init(uploadImage: UIImage){
        self.uploadImage = uploadImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UploadViewcontroller: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        
        textView.text = nil
        textView.textColor = .label
    }
}

private extension UploadViewcontroller {
    func setupNavigationItem() {
        navigationItem.title = "새 게시물"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(didTapLeftButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "공유", style: .plain, target: self, action: #selector(didTapRightButton))
    }
    
    @objc func didTapLeftButton() {
        dismiss(animated: true)
    }
    
    @objc func didTapRightButton() {
        dismiss(animated: true)
    }
    
    func setupLayout() {
        [imageView, textView].forEach{ view.addSubview($0)}
        
        let imageViewInset: CGFloat = 16.0
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(imageViewInset)
            make.leading.equalToSuperview().inset(imageViewInset)
            make.width.equalTo(100.0)
            make.height.equalTo(imageView.snp.width)
        }
        
        textView.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(imageViewInset)
            make.trailing.equalToSuperview().inset(imageViewInset)
            make.top.equalTo(imageView.snp.top)
            make.bottom.equalTo(imageView.snp.bottom)
        }
    }
}
