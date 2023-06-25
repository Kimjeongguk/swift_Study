//
//  FeedTableViewCell.swift
//  OutStargram
//
//  Created by Jeongguk Kim on 2023/06/18.
//

import UIKit
import SnapKit

final class FeedTableViewCell: UITableViewCell {
    private lazy var postImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .tertiaryLabel
        
        return imageView
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "heart")
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "message")
        return button
    }()
    
    private lazy var directMessageButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "paperplane")
        return button
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "bookmark")
        return button
    }()
    
    private lazy var currentLikedCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.text = "김정국님 외 22명이 좋아합니다."
        return label
    }()
    
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        label.numberOfLines = 5
        label.text = "후아 의지가 안생긴다...."
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 11.0, weight: .semibold)
        label.text = "1일 전"
        return label
    }()
    
    func setup() {
        [
            postImageView,
            likeButton,
            commentButton,
            directMessageButton,
            bookmarkButton,
            currentLikedCountLabel,
            contentsLabel,
            dateLabel
        ].forEach { addSubview($0) }
        
        postImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(postImageView.snp.width)
        }
        
        let buttonWidth: CGFloat = 24.0
        let buttonInset: CGFloat = 16.0
        
        likeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(buttonInset)
            make.top.equalTo(postImageView.snp.bottom).offset(buttonInset)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonWidth)
        }
        
        commentButton.snp.makeConstraints { make in
            make.leading.equalTo(likeButton.snp.trailing).offset(12.0)
            make.top.equalTo(likeButton.snp.top)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonWidth)
        }
        
        directMessageButton.snp.makeConstraints { make in
            make.leading.equalTo(commentButton.snp.trailing).offset(12.0)
            make.top.equalTo(likeButton.snp.top)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonWidth)
        }
        
        bookmarkButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(buttonInset)
            make.top.equalTo(likeButton.snp.top)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonWidth)
        }
        
        currentLikedCountLabel.snp.makeConstraints { make in
            make.leading.equalTo(likeButton.snp.leading)
            make.trailing.equalTo(bookmarkButton.snp.trailing)
            make.top.equalTo(likeButton.snp.bottom).offset(14.0)
        }
        
        contentsLabel.snp.makeConstraints { make in
            make.leading.equalTo(likeButton.snp.leading)
            make.trailing.equalTo(bookmarkButton.snp.trailing)
            make.top.equalTo(currentLikedCountLabel.snp.bottom).offset(8.0)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(likeButton.snp.leading)
            make.trailing.equalTo(bookmarkButton.snp.trailing)
            make.top.equalTo(contentsLabel.snp.bottom).offset(8.0)
            make.bottom.equalToSuperview().inset(16.0)
        }
    }
}
