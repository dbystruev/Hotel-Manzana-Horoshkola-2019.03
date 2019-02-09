//
//  File.swift
//  Hotel Manzana
//
//  Created by Гость on 04/02/2019.
//  Copyright © 2019 Гость. All rights reserved.
//

import Foundation

struct Registration {
    var firstName: String
    var lastName: String
    var emailAddress: String
    
    var checkInDate: Date
    var checkOutDate: Date
    var numberOfAdults: Int
    var numderOfChildren: Int
    
    var roomType: RoomType
    var wifi: Bool
}
