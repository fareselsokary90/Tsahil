//
//  NotificationCell.swift
//  Tsahil
//
//  Created by fares elsokary on 10/28/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var Time: UILabel!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var Mesagge: UILabel!
    @IBOutlet weak var CenterName: UILabel!
    @IBOutlet weak var Logo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
