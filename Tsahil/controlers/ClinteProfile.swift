//
//  ClinteProfile.swift
//  Tsahil
//
//  Created by fares elsokary on 10/27/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import UIKit
import MapKit
class ClinteProfile: UIViewController {
    
    @IBOutlet weak var SideMenu: UIButton!
    @IBOutlet weak var MApView: MKMapView!
    @IBOutlet weak var MenuCollection: UICollectionView!
    var indicatorView = UIView()
    var indecatorHeight : CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CreatIndecatorView()
        // Do any additional setup after loading the view.
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
    func CreatIndecatorView(){
        indicatorView.backgroundColor = #colorLiteral(red: 0.01100640744, green: 0.6622086763, blue: 0.9578379989, alpha: 1)
        indicatorView.frame = CGRect(x: 0, y: MenuCollection.bounds.maxY - indecatorHeight, width: MenuCollection.bounds.width / 3, height: indecatorHeight)
        MenuCollection.addSubview(indicatorView)
    }
    
    
    @IBAction func SideMenuButton(_ sender: Any) {
        ShowLeftMenu()
    }
    
    
}
extension ClinteProfile : UICollectionViewDelegate ,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCollectionViewCell
        cell.setupCell(title: "Location")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 3, height: collectionView.bounds.height )
    }
    
}
