//
//  ResultOnMapViewController.swift
//  Tsahil
//
//  Created by fares elsokary on 10/23/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import UIKit

class ResultOnMapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func showMapResult(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mapResultOnTable") as! mapResultOnTable
        present(storyboard, animated : true, completion : nil)
    }
}
