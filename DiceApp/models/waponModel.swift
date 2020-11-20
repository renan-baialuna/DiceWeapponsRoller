//
//  waponModel.swift
//  DiceApp
//
//  Created by Renan Baialuna on 11/11/20.
//  Copyright © 2020 Renan Baialuna. All rights reserved.
//

import Foundation

enum ColorsEnum : String {
    case main = "MainSelector",
    seccond = "SeccundaryBackground",
    third = "SeccondSelector",
    background = "MainBackground"
}

enum fontsEnum : String {
    case normal = "CinzelDecorative-regular",
    bold = "CinzelDecorative-Bold",
    black = "CinzelDecorative-Black"
}
    
enum modifier {
    case minusOne
    case none
    case plusOne
}

enum typeOfDiceSelector : String {
    case uno = "",
    d3 = "d3",
    d6 = "d6"
}

enum typesOfWeappons: String {
    case malee = "malee",
    pistol = "pistol",
    rapidFire = "rapidFire",
    assalt = "assalt",
    heavy = "heavy",
    granade = "granade"
}

struct Weappon: Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let type: typesOfWeappons
    let name: String
    let range: Int
    let numberOfShots: Int
    let shootsCountType: typeOfDiceSelector
    let strength: Int
    let armorPenetration: Int
    let damage: Int
    let damageCountType: typeOfDiceSelector
    let isAutoHit: Bool = false
    let weapponHitModifier: modifier
    let weapponWondModifier: modifier
}
