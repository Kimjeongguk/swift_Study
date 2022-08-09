//
//  StationArrivalDatResponseModel.swift
//  SubWayStation
//
//  Created by Jeongguk Kim on 2022/08/09.
//

import Foundation

struct StationArrivalDatResponseModel: Decodable {
    var realtimeArrivalList: [RealTimeArrival] = []
    
    struct RealTimeArrival: Decodable {
        let line: String
        let remainTime: String
        let currentStation: String
        
        
        enum CodingKeys: String, CodingKey {
            case line = "trainLineNm"
            case remainTime = "arvlMsg2"
            case currentStation = "arvlMsg3"
        }
    }
}
