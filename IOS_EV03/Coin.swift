//
//  Coin.swift
//  IOS_EV03
//
//  Created by Plancquet Frederic on 14/09/2022.
//

import Foundation


struct Data: Codable {
    var data: [Coin]
}

struct Coin: Codable {
    var id: String
    var rank: String
    var name: String
    var symbol: String
    var supply: String
    var marketCapUsd: String
    var volumeUsd24Hr: String
    var priceUsd: String
    var changePercent24Hr: String
    var vwap24Hr: String?
    var explorer: String?
    
}
