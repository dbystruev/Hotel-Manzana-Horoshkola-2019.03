//
//  RomType.swift
//  Hotel Manzana
//
//  Created by Гость on 04/02/2019.
//  Copyright © 2019 Гость. All rights reserved.
//

import Foundation

struct RoomType: Equatable {
    var id: Int
    var name: String
    var shortName: String
    var price: Int
    
    static func == (lhs: RoomType, rhs: RoomType) -> Bool {
        return lhs.id == rhs.id
    }
}
    

