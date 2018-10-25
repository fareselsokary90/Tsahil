//
//  ImageBorder.swift
//  Doctor booking
//
//  Created by fares elsokary on 10/8/18.
//  Copyright © 2018 FaresElsokary. All rights reserved.
//

import UIKit
@IBDesignable
class ImageBorder: UIImageView {
   
    @IBInspectable var CornerRadius_1 :CGFloat = 0{
        didSet{
            self.clipsToBounds = true
            self.layer.cornerRadius = frame.size.width/CornerRadius_1
            
        }
    }
    
    @IBInspectable var BorderWidth :CGFloat = 0{
        didSet{
            self.layer.borderWidth = BorderWidth
        }
    }
    @IBInspectable var BorderColer :UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = BorderColer.cgColor
        }
    }
    override func awakeFromNib() {
        self.clipsToBounds = true
        self.layer.cornerRadius = frame.size.width/CornerRadius_1
    }
    
    
}
