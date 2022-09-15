//
//  Historique.swift
//  IOS_EV03
//
//  Created by Plancquet Frederic on 15/09/2022.
//

import Foundation

struct Historic: Codable {
    var data : [Log]
}

struct Log: Codable {
    var priceUsd: String
    var time: Int
    var date: String
}
