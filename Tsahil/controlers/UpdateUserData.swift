//
//  UpdateUserData.swift
//  Tsahil
//
//  Created by fares elsokary on 10/28/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import UIKit

class UpdateUserData: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "my amazing title"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
    

}
