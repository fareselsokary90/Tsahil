//
//  mapResultOnTable.swift
//  Tsahil
//
//  Created by fares elsokary on 10/23/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import UIKit




class mapResultOnTable: UIViewController {
    
    
    var status : Bool = false
    
    @IBOutlet weak var numberOfResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(showLeftMenu))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    
    @objc func toggleSideMenu(){
       showLeftMenu()
    }
    
    
    @objc func showLeftMenu() {
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
    
    
    @objc func closeSideMenu(){
        UIView.animate(withDuration: 0.3, animations: {
            var frame = self.view.frame
            frame.origin.x = -UIScreen.main.bounds.size.width
            self.view.frame = frame
        }) { (animation : Bool) in
            self.view.removeFromSuperview()
        }
    }
    
    
    @IBAction func BackItem(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func menuItem(_ sender: Any) {
        showLeftMenu()
    }
    
}

extension mapResultOnTable : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "delerCell", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}





//        let Image = UIImage(named: "menu")
//        let Image2 = UIImage(named: "left-arrow")
//        self.navigationController?.navigationBar.backIndicatorImage = Image2
//        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = Image2
//        self.navigationController?.navigationBar.topItem?.title = " "
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: Image, landscapeImagePhone: Image, style: .plain, target: self, action: #selector(closeSideMenu))
//        self.navigationItem.title = "List result"

