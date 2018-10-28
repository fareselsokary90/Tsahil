//
//  Notification.swift
//  Tsahil
//
//  Created by fares elsokary on 10/28/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import UIKit

class NotificationView: UITableViewController {

    
    
    
    @IBOutlet var NotificationTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationTable.rowHeight = UITableView.automaticDimension
        NotificationTable.estimatedRowHeight = 75
        
       
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificatinCell", for: indexPath)
        
        return cell
    }
    
    
    @IBAction func BackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func MenuButton(_ sender: Any) {
    }
    
}
