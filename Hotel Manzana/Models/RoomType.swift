//
//  RomType.swift
//  Hotel Manzana
//
//  Created by Гость on 04/02/2019.
//  Copyright © 2019 Гость. All rights reserved.
//

import Foundation

struct RoomType: Codable, Equatable {
    var id: Int
    var name: String
    var shortName: String
    var price: Int
    
    static var all: [RoomType] {
        return [RoomType(id: 1, name: "King Bed", shortName: "KB", price: 179), RoomType(id: 2, name: "Two queen beds", shortName: "2QB", price: 229),RoomType(id: 3, name: "PentHouse", shortName: "PH", price: 329),]
    }
    static func == (lhs: RoomType, rhs: RoomType) -> Bool {
        return lhs.id == rhs.id
    }
}
    

