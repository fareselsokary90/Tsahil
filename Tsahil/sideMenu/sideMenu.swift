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
        
        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(closeSideMenu(Duration:)))
        swipeleft.direction = .left
        self.view.addGestureRecognizer(swipeleft)
       
        

//        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(closeSideMenu))
//        tapGesture.numberOfTapsRequired = 1
//        self.view.addGestureRecognizer(tapGesture)
    }

    
    
    
    
    
    
    

    @objc func closeSideMenu(Duration : Float = 0.3){
        UIView.animate(withDuration: TimeInterval(Duration), animations: {
            var frame = self.view.frame
            frame.origin.x = -UIScreen.main.bounds.size.width
            self.view.frame = frame
        }) { (animation : Bool) in
            self.view.removeFromSuperview()
        }
        
    }
    
    
    @objc func ShowLeftMenu(){
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
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controler = storyBoard.instantiateViewController(withIdentifier: "Home") as! Home
        self.present(controler, animated: true , completion: nil)
        closeSideMenu(Duration: 0.1)
    }
    
    @IBAction func Request(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controler = storyBoard.instantiateViewController(withIdentifier: "Request") as! RequestView
        self.present(controler, animated: true , completion: nil)
        closeSideMenu(Duration: 0.1)
    }
    
    @IBAction func setting(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controler = storyBoard.instantiateViewController(withIdentifier: "Setting") 
        self.present(controler, animated: true , completion: nil)
        closeSideMenu(Duration: 0.1)
    }
    
    @IBAction func notification(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controler = storyBoard.instantiateViewController(withIdentifier: "Notification")
        self.present(controler, animated: true , completion: nil)
        closeSideMenu(Duration: 0.1)
    }
    
    @IBAction func contactUS(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controler = storyBoard.instantiateViewController(withIdentifier: "Contact") as! ContactUs
        self.present(controler, animated: true , completion: nil)
        closeSideMenu(Duration: 0.1)
    }
}

