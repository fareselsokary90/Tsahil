//
//  Home.swift
//  Tsahil
//
//  Created by fares elsokary on 10/22/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import UIKit

class Home: UIViewController {
    
    
    @IBOutlet weak var dropList: UITableView!
    @IBOutlet weak var dropList1: UITableView!
    @IBOutlet weak var dropList2: UITableView!
    @IBOutlet weak var dropList3: UITableView!
    
   
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    
    
    
    
    var list = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        droplistRoundCorner()
        
       assignbackground()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ShowLeftMenu))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        // Do any additional setup after loading the view.
    }
    
    
    func droplistRoundCorner(){
        dropList.layer.cornerRadius = 10
        dropList.clipsToBounds = true
        dropList1.layer.cornerRadius = 10
        dropList1.clipsToBounds = true
        dropList2.layer.cornerRadius = 10
        dropList2.clipsToBounds = true
        dropList3.layer.cornerRadius = 10
        dropList3.clipsToBounds = true
        
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
    
    func assignbackground(){
        // self.view.backgroundColor = UIColor(white: CGFloat(ffffff), alpha: 1)
        let background = UIImage(named: "Slpash-BG")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }

   
    
    
    
  
    
    
    
    func toggleDropList(table : UITableView){
        UIView.animate(withDuration: 0.35) {
            if table.isHidden == true{
                table.isHidden = false
            }else{
                table.isHidden = true
            }
        }
    }
    
    
    
    @IBAction func droplistButton(_ sender: UIButton) {
        if sender.tag == 1 || sender.tag == 21{
            toggleDropList(table: dropList)
        }else if sender.tag == 2 || sender.tag == 32{
            toggleDropList(table: dropList1)
        }else if sender.tag == 3 || sender.tag == 33{
            toggleDropList(table: dropList2)
        }else if sender.tag == 4 || sender.tag == 34{
            toggleDropList(table: dropList3)
        }
    }
    
   
    
    @IBAction func showLeftMenu(_ sender: Any) {
        ShowLeftMenu()
        
    }

}
extension Home : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == dropList {
            Button.setTitle(list[indexPath.row], for: .normal)
            toggleDropList(table: dropList)
        }else if tableView == dropList1{
            Button1.setTitle(list[indexPath.row], for: .normal)
            toggleDropList(table: dropList1)
        }else if tableView == dropList2{
            Button2.setTitle(list[indexPath.row], for: .normal)
            toggleDropList(table: dropList2)
        }else if tableView == dropList3{
            Button3.setTitle(list[indexPath.row], for: .normal)
            toggleDropList(table: dropList3)
        }
    }
    
}

