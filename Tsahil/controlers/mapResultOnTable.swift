//
//  mapResultOnTable.swift
//  Tsahil
//
//  Created by fares elsokary on 10/23/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import UIKit


 

class mapResultOnTable: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       let Image = UIImage(named: "menu")
        let Image2 = UIImage(named: "left-arrow")
        self.navigationController?.navigationBar.backIndicatorImage = Image2
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = Image2
        
        self.navigationController?.navigationBar.topItem?.title = " "
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: Image, landscapeImagePhone: Image, style: .plain, target: self, action: #selector(showLetMenu(_:)))
        
        self.navigationItem.title = "List result"
        
    }
    

    @IBAction func showLetMenu(_ sender: Any) {
        let leftMEnu = sideMenu.init(nibName: "sideMenu", bundle: nil)
        var frame = leftMEnu.view.frame
        frame.origin.x = -UIScreen.main.bounds.size.width
        leftMEnu.view.frame = frame
        self.addChild(leftMEnu)
        self.view.addSubview(leftMEnu.view)
        UIView.animate(withDuration: 0.4) {
            frame.origin.x = 0
            leftMEnu.view.frame = frame
        }
        
    }

}
