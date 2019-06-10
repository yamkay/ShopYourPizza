//
//  Toppings.swift
//  ShopYourPizza
//
//  Created by Selvaraj, Mohan on 6/9/19.
//  Copyright © 2019 YAMKAY. All rights reserved.
//

import Foundation

class Topping: Decodable {
    let id: Int?
    let name: String?
    let toppingDescription: String?
    let asset: Asset?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case toppingDescription = "description"
        case asset
    }
}
