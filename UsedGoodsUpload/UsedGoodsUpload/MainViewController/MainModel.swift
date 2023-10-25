//
//  MainModel.swift
//  UsedGoodsUpload
//
//  Created by jeongguk on 2023/10/24.
//

import Foundation

struct MainModel {
    func setAlert(errorMessage: [String]) -> Alert {
        let title = errorMessage.isEmpty ? "성공" : "실패"
        let message = errorMessage.isEmpty ? nil : errorMessage.joined(separator: "\n")
        return (title: title, message: message)
        
    }
}
