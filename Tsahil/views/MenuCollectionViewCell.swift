//
//  MEnuCollectionViewCell.swift
//  Tsahil
//
//  Created by fares elsokary on 10/25/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var TitleLable: UILabel!
    let color1 : UIColor = #colorLiteral(red: 0.01100640744, green: 0.6622086763, blue: 0.9578379989, alpha: 1)
     let color2 : UIColor = #colorLiteral(red: 0.5137935281, green: 0.5101613998, blue: 0.517601788, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        TitleLable.center = self.center
        
    }
    
    func setupCell(title : String){
        TitleLable.text = title
    }
    override var isSelected: Bool{
        didSet{
            TitleLable.textColor = isSelected ? color1 : color2
        }
    }
}
