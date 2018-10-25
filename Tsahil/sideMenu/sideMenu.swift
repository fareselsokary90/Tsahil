//
//  sideMenu.swift
//  sideMenu Demo
//
//  Created by fares elsokary on 10/22/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import UIKit

class sideMenu: UIViewController {
    
    
    
     
    

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var SideView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(closeSideMenu))
        swipeleft.direction = .left
        self.view.addGestureRecognizer(swipeleft)
       
        

//        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(closeSideMenu))
//        tapGesture.numberOfTapsRequired = 1
//        self.view.addGestureRecognizer(tapGesture)
    }

    
    
    
    
    
    
    

   @objc func closeSideMenu(){
        UIView.animate(withDuration: 0.3, animations: {
            var frame = self.view.frame
            frame.origin.x = -UIScreen.main.bounds.size.width
            self.view.frame = frame
        }) { (animation : Bool) in
            self.view.removeFromSuperview()
        }
        
    }
//    @IBAction func btnPressed(_ sender: Any) {
//        closeSideMenu()
//        let viewControler = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "test")
//        self.present(viewControler, animated: false, completion: nil)
//    }
    
    
    func toggleButtonBackground(sender : UIButton){
        if sender.isSelected == true{
            sender.backgroundColor = UIColor.black
            print("ok")
        }
    }
    
    
    
    @IBAction func home(_ sender: UIButton) {
        
    }
    
    @IBAction func Request(_ sender: UIButton) {
    }
    
    @IBAction func setting(_ sender: UIButton) {
    }
    
    @IBAction func notification(_ sender: UIButton) {
    }
    
    @IBAction func contactUS(_ sender: Any) {
    }
}

