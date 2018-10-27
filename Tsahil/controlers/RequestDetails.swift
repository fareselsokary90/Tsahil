//
//  RequestDetails.swift
//  Tsahil
//
//  Created by fares elsokary on 10/27/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import UIKit
import MapKit
class RequestDetails: UIViewController {

    @IBOutlet weak var MapView: MKMapView!
    @IBOutlet weak var CoastLable: UIView!
    @IBOutlet weak var Service: UILabel!
    @IBOutlet weak var PaymentMethod: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func BackButton(_ sender: UIBarButtonItem) {
    }
    

    @IBAction func ReportProblem(_ sender: UIButton) {
    }
}
