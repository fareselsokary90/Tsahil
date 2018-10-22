//
//  SignUp.swift
//  Tsahil
//
//  Created by fares elsokary on 10/17/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import UIKit
@IBDesignable
class SignUp: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
            
       assignbackground()
    }
    
    
    
    func assignbackground(){
       // self.view.backgroundColor = UIColor(white: CGFloat(ffffff), alpha: 1)
        let background = UIImage(named: "Slpash-BG2")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
   
}
