//
//  ReviewCellTableViewCell.swift
//  Tsahil
//
//  Created by fares elsokary on 10/25/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import UIKit
import Cosmos
class ReviewCellTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        updateCosmosView()
        // Initialization code
    }
    @IBOutlet weak var CosomosView: CosmosView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var ReiewLable: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func updateCosmosView(){
        CosomosView.rating = 4
        CosomosView.didFinishTouchingCosmos = { rating in
            self.CosomosView.text = String(rating)
        }
        CosomosView.didTouchCosmos = { rating in }
        // Use if you need just to show the stars without getting user's input
        CosomosView.settings.updateOnTouch = false
        // Show only fully filled stars
        CosomosView.settings.fillMode = .half
        // Other fill modes: .half, .precise
    }
    
}
