//
//  RankingFeature.swift
//  AppStore
//
//  Created by Jeongguk Kim on 2022/08/07.
//

import Foundation

struct RankingFeature: Decodable {
    let title: String
    let description: String
    let isInPurchaseApp: Bool
}
