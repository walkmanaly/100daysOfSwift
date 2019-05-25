//
//  Capital.swift
//  Project16
//
//  Created by Nick on 2019/5/25.
//  Copyright © 2019 Nick. All rights reserved.
//

import MapKit
import UIKit

class Capital: NSObject, MKAnnotation {
    var capital: String?
    var coordinate: CLLocationCoordinate2D
    var info: String?
    init(capital: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.capital = capital;
        self.coordinate = coordinate
        self.info = info
    }
}
