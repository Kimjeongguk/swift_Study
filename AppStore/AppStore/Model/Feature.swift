//
//  Feature.swift
//  AppStore
//
//  Created by Jeongguk Kim on 2022/08/07.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
