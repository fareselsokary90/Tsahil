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
    
    @IBOutlet weak var textField0: UITextField!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    
    
    
    
    var list = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       assignbackground()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ShowLeftMenu))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        // Do any additional setup after loading the view.
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
        if sender.tag == 1{
            toggleDropList(table: dropList)
        }else if sender.tag == 2{
            toggleDropList(table: dropList1)
        }else if sender.tag == 3{
            toggleDropList(table: dropList2)
        }else if sender.tag == 4{
            toggleDropList(table: dropList3)
        }
    }
    
    @IBAction func textField(_ sender: UITextField) {
            dropList.isHidden = false
    }
    
    @IBAction func textField1(_ sender: UITextField) {
        dropList1.isHidden = false
    }
    @IBAction func textField2(_ sender: UITextField) {
        dropList2.isHidden = false
    }
    
    @IBAction func textField3(_ sender: UITextField) {
        dropList3.isHidden = false
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
        textField0.text = list[indexPath.row]
        toggleDropList(table: dropList)
        }else if tableView == dropList1{
            textField1.text = list[indexPath.row]
            toggleDropList(table: dropList1)
        }else if tableView == dropList2{
            textField2.text = list[indexPath.row]
            toggleDropList(table: dropList2)
        }else if tableView == dropList3{
            textField3.text = list[indexPath.row]
            toggleDropList(table: dropList3)
        }
    }
    
}

