//
//  Beer.swift
//  Brewery
//
//  Created by Jeongguk Kim on 2022/07/26.
//

import Foundation

struct Beer: Decodable {
    let id: Int?
    let name, taglineString, description, brewersTips, imageURL: String?
    let foodParing: [String]?
    
    var tagLine: String {
        let tags = taglineString?.components(separatedBy: ". ")
        let hashTags = tags?.map{
            "#" + $0.replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: ".", with: "")
                .replacingOccurrences(of: ", ", with: "#")
        }
        return hashTags?.joined(separator: " ") ?? ""
    }
    
    enum CodingKeys: String, CodingKey{
        case id, name, description
        case taglineString = "tagline"
        case imageURL = "image_Url"
        case brewersTips = "brewers_tips"
        case foodParing = "food_paring"
    }
}
