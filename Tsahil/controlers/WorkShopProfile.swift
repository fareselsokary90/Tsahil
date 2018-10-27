//
//  WorkShopProfile.swift
//  Tsahil
//
//  Created by fares elsokary on 10/24/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import UIKit
import Cosmos
import MapKit
class WorkShopProfile: UIViewController {
    
    // MARK: -  Outlets
    @IBOutlet weak var MenuCollection: UICollectionView!
    @IBOutlet weak var SideMenu: UIButton!
    @IBOutlet weak var AddReview: UIButton!
    @IBOutlet weak var widthConstrain: NSLayoutConstraint!
    @IBOutlet weak var sendRequest: RoundButtonCorners!
    @IBOutlet weak var CosmosView: CosmosView!
    @IBOutlet weak var tableViewReview: UITableView!
    @IBOutlet weak var MApView: MKMapView!
    @IBOutlet weak var DetailsView: UIView!
    @IBOutlet weak var ReviewView: UIView!
    @IBOutlet weak var ViewTableReview: UIView!
    // MARK: - Declration
    let menuTitle = ["Location", "Reviews", "About"]
    var selectedIndex = 0
    var selectedIndexPath = IndexPath(item: 0, section: 0)
    var indicatorView = UIView()
    var indecatorHeight : CGFloat = 3
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableViewReview.rowHeight = UITableView.automaticDimension
        tableViewReview.estimatedRowHeight = 65
        
        
        sendRequest.selectedButton(title: "  Send Service Request", iconName: "send-button")
        AddReview.selectedButton(title: " Add Review", iconName: "add")
        MenuCollection.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .centeredHorizontally)
        updateCosmosView()
        SwipGesture()
        CreatIndecatorView(DesiredX: 0)
        tableViewReview.estimatedRowHeight = 50
        tableViewReview.rowHeight = UITableView.automaticDimension
    }
    
    
    // MARK: - Create Indicator
    
    func refreshIndecator(x : CGFloat){
        UIView.animate(withDuration: 0.3) {
            let desiredX = (self.MenuCollection.bounds.width / CGFloat(self.menuTitle.count)) * x
            self.CreatIndecatorView(DesiredX: desiredX)
        }
    }
    
    
    func CreatIndecatorView(DesiredX : CGFloat){
        indicatorView.backgroundColor = #colorLiteral(red: 0.01100640744, green: 0.6622086763, blue: 0.9578379989, alpha: 1)
        indicatorView.frame = CGRect(x: DesiredX, y: MenuCollection.bounds.maxY - indecatorHeight, width: MenuCollection.bounds.width / CGFloat(menuTitle.count), height: indecatorHeight)
        MenuCollection.addSubview(indicatorView)
    }
    
    //MARK: - Create swipeGesture to view to refresh indicator position
    func SwipGesture(){
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(SwipeGesure(_:)))
        leftSwipe.direction = .left
        self.DetailsView.addGestureRecognizer(leftSwipe)
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(SwipeGesure(_:)))
        rightSwipe.direction = .right
        self.DetailsView.addGestureRecognizer(rightSwipe)
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
        MenuCollection.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .centeredHorizontally)
        if selectedIndex == 0{
            MApView.isHidden = false
            ViewTableReview.isHidden = true
            ReviewView.isHidden = true
        }else if selectedIndex == 1 {
            MApView.isHidden = true
            ViewTableReview.isHidden = false
            ReviewView.isHidden = true
        }else{
            MApView.isHidden = true
            ViewTableReview.isHidden = true
            ReviewView.isHidden = false
        }
    }
    
    
    // MARK: - Update Cosmos Rating View
    func updateCosmosView(){
        CosmosView.rating = 4
        CosmosView.didFinishTouchingCosmos = { rating in
            self.CosmosView.text = String(rating)
        }
        CosmosView.didTouchCosmos = { rating in }
        // Use if you need just to show the stars without getting user's input
        CosmosView.settings.updateOnTouch = false
        // Show only fully filled stars
        CosmosView.settings.fillMode = .half
        // Other fill modes: .half, .precise
    }
    
    //TODO: - Creat RatingViewInAlert
    func RatingView(alert : UIAlertController)-> CosmosViewAlert{
        let width : CGFloat = 130
        let height : CGFloat = 20
        let margin:CGFloat = 25.0
        let rect = CGRect(x: (alert.view.frame.width / 2) - width , y: margin, width: width, height: height)
        let customView = CosmosViewAlert(frame : rect)
        customView.rating = 0.5
        customView.text = "0.5"
        customView.tintColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        customView.didFinishTouchingCosmos = { rating in
        }
        customView.didTouchCosmos = { rating in
            customView.text = String(rating)
        }
        customView.settings.updateOnTouch = true
        customView.settings.fillMode = .half
        return customView
    }
    
    
    
    //TODO: Create alert
    func CreatAlert(){
        let alert = UIAlertController(title: "\n", message: nil, preferredStyle: .alert)
        let customView = RatingView(alert: alert)
        alert.addTextField { (UITextField) in
            UITextField.placeholder = "Message..."
            let heightConstraint = NSLayoutConstraint(item: UITextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
            UITextField.addConstraint(heightConstraint)
        }
        alert.view.addSubview(customView)
        let addReview = UIAlertAction(title: "Submit", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(addReview)
        alert.addAction(cancel)
        present(alert , animated: true , completion: nil)
    }
    
    
    //TODO: - SHOW LEFT MENU
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
    
    
    
    // MARK: - IBAction
    @IBAction func SendServiceRequest(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            self.sendRequest.selectedButton(title: "  Service Request Sent", iconName: "send-message-button")
        }
    }
    
    @IBAction func AddReview(_ sender: UIButton) {
        CreatAlert()
    }
    
    @IBAction func showSideMenu(_ sender: Any) {
        ShowLeftMenu()
    }
    
    
}

extension UIButton {
    func selectedButton(title:String, iconName: String){

        self.setTitle(title, for: .normal)
        self.setTitle(title, for: .highlighted)
        
        //self.setTitleColor(UIColor.white, for: .normal)
        self.setTitleColor(UIColor.white, for: .highlighted)
        self.setImage(UIImage(named: iconName), for: .normal)
        self.setImage(UIImage(named: iconName), for: .highlighted)
        //        let imageWidth = self.imageView!.frame.width
        //        let textWidth = (title as NSString).size(withAttributes:[NSAttributedString.Key.font:self.titleLabel!.font!]).width
        //        let width = textWidth + imageWidth + 30
        //        //24 - the sum of your insets from left and right
        //        widthConstraints.constant = width
        self.layoutIfNeeded()
    }
}

//   //////////////////////////////////////////////

extension WorkShopProfile : UICollectionViewDelegate ,UICollectionViewDataSource{
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
        if indexPath.item == 0{
            MApView.isHidden = false
            ViewTableReview.isHidden = true
            ReviewView.isHidden = true
        }else if indexPath.item == 1 {
            MApView.isHidden = true
            ViewTableReview.isHidden = false
            ReviewView.isHidden = true
        }else{
            MApView.isHidden = true
            ViewTableReview.isHidden = true
            ReviewView.isHidden = false
        }
    }
}

// //////////////////////////////////////////////////////

extension WorkShopProfile : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath)
        cell.sizeToFit()
        cell.layoutIfNeeded()
        return cell
    }
}
