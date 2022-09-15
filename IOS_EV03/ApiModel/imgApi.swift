//
//  imgApi.swift
//  IOS_EV03
//
//  Created by Plancquet Frederic on 14/09/2022.
//

import Foundation

struct CoinImg: Codable {
    var coins: [Coins]
}

struct Coins: Codable {
    var id: String
    var icon: String
}
