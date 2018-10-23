//
//  RoundButtonCorners.swift
//  Doctor booking
//
//  Created by fares elsokary on 10/7/18.
//  Copyright © 2018 FaresElsokary. All rights reserved.
//

import UIKit
@IBDesignable
class RoundButtonCorners: UIButton {
    @IBInspectable var CornerRadius :CGFloat = 0{
        didSet{
            self.layer.cornerRadius = CornerRadius
            self.titleLabel?.minimumScaleFactor = 0.5
            self.titleLabel?.numberOfLines = 0
            self.titleLabel?.adjustsFontSizeToFitWidth = true
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
   
}
