//
//  Pizza.swift
//  ShopYourPizza
//
//  Created by Selvaraj, Mohan on 6/9/19.
//  Copyright © 2019 YAMKAY. All rights reserved.
//

import Foundation

class Pizza: Decodable {
    let id: Int?
    let name, price, menuDescription: String?
    let classifications: Classifications?
    let assets: Assets?
    let toppings: [Topping]?
    
    enum CodingKeys: String, CodingKey {
        case id, name, price
        case menuDescription = "menu_description"
        case classifications, assets, toppings
    }
}
