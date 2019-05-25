//
//  ViewController.swift
//  Project16
//
//  Created by Nick on 2019/5/25.
//  Copyright © 2019 Nick. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let beijin = Capital(capital: "beijing", coordinate: CLLocationCoordinate2D(latitude: 116.46, longitude: 40), info: "in china")
        let tokyo = Capital(capital: "tokyo", coordinate: CLLocationCoordinate2D(latitude: 138.4, longitude: 35), info: "in japan")
        let newYork = Capital(capital: "newyork", coordinate: CLLocationCoordinate2D(latitude: 38.4, longitude: 23), info: "in amercan")
        
        mapView.addAnnotations([beijin, tokyo, newYork])
    }


}

