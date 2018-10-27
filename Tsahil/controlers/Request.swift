//
//  Request.swift
//  Tsahil
//
//  Created by fares elsokary on 10/27/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import UIKit

class RequestView: UIViewController {
    
    let menuTitle = ["Current", "History"]
    var selectedIndex = 0
    var selectedIndexPath = IndexPath(item: 0, section: 0)
    var indicatorView = UIView()
    var indecatorHeight : CGFloat = 3
    
    
    
    @IBOutlet weak var CollectionMenu: UICollectionView!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var ResultTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SwipGesture()
        CreatIndecatorView(DesiredX : 0)
        ResultTable.rowHeight = UITableView.automaticDimension
        ResultTable.estimatedRowHeight = 110
        // Do any additional setup after loading the view.
    }
    
    
   
    //MARK: - Add SwipeGEsture
    
    func SwipGesture(){
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(SwipeGesure(_:)))
        leftSwipe.direction = .left
        self.ResultTable.addGestureRecognizer(leftSwipe)
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(SwipeGesure(_:)))
        rightSwipe.direction = .right
        self.ResultTable.addGestureRecognizer(rightSwipe)
    }
    
    
    @objc func SwipeGesure(_ sender : UISwipeGestureRecognizer){
        if sender.direction == .left{
            if selectedIndex < menuTitle.count - 1{
                selectedIndex += 1
            }
        }else if sender.direction == .right{
            if selectedIndex > 0{
                selectedIndex -= 1
            }
        }
        selectedIndexPath = IndexPath(item: selectedIndex, section: 0)
        refreshIndecator(x : CGFloat(selectedIndex))
        CollectionMenu.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    //MARK: - CREATE COLLECTION VIEW INDECATOR
    
    //TODO: - Refresh Indecator position
    func refreshIndecator(x : CGFloat){
        UIView.animate(withDuration: 0.3) {
            let desiredX = (self.CollectionMenu.bounds.width / CGFloat(self.menuTitle.count)) * x
            self.CreatIndecatorView(DesiredX: desiredX)
        }
    }
    
    //TODO: - Create indcator
    func CreatIndecatorView(DesiredX : CGFloat){
        indicatorView.backgroundColor = #colorLiteral(red: 0.01100640744, green: 0.6622086763, blue: 0.9578379989, alpha: 1)
        indicatorView.frame = CGRect(x: DesiredX, y: CollectionMenu.bounds.maxY - indecatorHeight, width: CollectionMenu.bounds.width / CGFloat(menuTitle.count), height: indecatorHeight)
        CollectionMenu.addSubview(indicatorView)
    }
    
    //TODO: - Show Side Menu
    
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
    
    //MARK:- IBAction
    
    @IBAction func BackButtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func MenuButton(_ sender: UIBarButtonItem) {
        showLeftMenu()
    }
    
    
    
}





extension RequestView : UICollectionViewDelegate ,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCollectionViewCell
        cell.setupCell(title: menuTitle[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / CGFloat(menuTitle.count), height: collectionView.bounds.height )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        refreshIndecator(x : CGFloat(indexPath.item))
//        if indexPath.item == 0{
//            MApView.isHidden = false
//            ViewTableReview.isHidden = true
//            ReviewView.isHidden = true
//        }else if indexPath.item == 1 {
//            MApView.isHidden = true
//            ViewTableReview.isHidden = false
//            ReviewView.isHidden = true
//        }else{
//            MApView.isHidden = true
//            ViewTableReview.isHidden = true
//            ReviewView.isHidden = false
//        }
    }
}
extension RequestView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestTableCell", for: indexPath)
        return cell
    }
    
    
}
