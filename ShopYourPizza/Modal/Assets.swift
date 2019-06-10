//
//  Assets.swift
//  ShopYourPizza
//
//  Created by Selvaraj, Mohan on 6/9/19.
//  Copyright © 2019 YAMKAY. All rights reserved.
//

import Foundation

class Assets: Decodable {
    let menu: [Menu]?
    let productDetailsPage: [ProductDetailsPage]?
    
    enum CodingKeys: String, CodingKey {
        case menu
        case productDetailsPage = "product_details_page"
    }
}
