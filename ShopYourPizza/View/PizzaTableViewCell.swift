//
//  PizzaTableViewCell.swift
//  ShopYourPizza
//
//  Created by Selvaraj, Mohan on 6/9/19.
//  Copyright © 2019 YAMKAY. All rights reserved.
//

import UIKit

class PizzaTableViewCell: UITableViewCell {

    @IBOutlet weak var pizzaImageView: UIImageView!
    @IBOutlet weak var pizzaNameLabel: UILabel!
    @IBOutlet weak var pizzaDescriptionLabel: UILabel!
    @IBOutlet weak var pizzaPriceLabel: UILabel!
    
    var pizza: Pizza? {
        didSet {
            if let name = pizza?.name {
                pizzaNameLabel.text = name
            }
            
            if let description = pizza?.menuDescription {
                pizzaDescriptionLabel.text = description
            }
            
            if let price = pizza?.price {
                pizzaPriceLabel.text = "$\(price)"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
