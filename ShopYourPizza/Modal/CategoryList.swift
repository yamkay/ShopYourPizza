//
//  CategoryList.swift
//  ShopYourPizza
//
//  Created by Selvaraj, Mohan on 6/9/19.
//  Copyright © 2019 YAMKAY. All rights reserved.
//

import Foundation

class CategoryList: Decodable {
    let categories: [String:[Pizza]]?
    
    required init(from decoder: Decoder) throws
    {
        var container = try decoder.unkeyedContainer()
        categories = try container.decode([String:[Pizza]].self)
    }
}
