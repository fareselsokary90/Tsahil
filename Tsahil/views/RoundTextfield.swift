//
//  RoundTextfield.swift
//  Tsahil
//
//  Created by fares elsokary on 10/16/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import UIKit

@IBDesignable
class RoundTextfield : UITextField {
    @IBInspectable var CornerRadius :CGFloat = 0{
        didSet{
            
            self.layer.cornerRadius = CornerRadius
            self.clipsToBounds = true
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
