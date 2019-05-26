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
        
        let oslo = Capital(capital: "oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "in oslo")
        let paris = Capital(capital: "paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "in franch")
        let rome = Capital(capital: "rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "in rome")
        
        mapView.addAnnotations([oslo, paris, rome])
    }


}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        let identifier = "capital"
        var annotationView = mapView .dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        let title = capital.title
        let info = capital.info
        
        let ac = UIAlertController(title: title, message: info, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let capital = view.annotation as? Capital else { return }
        let title = capital.title
        let info = capital.info
        let ac = UIAlertController(title: title, message: info, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            if (UIApplication.shared.canOpenURL(URL(string: "iosamap://")!)) {
                UIApplication.shared.open(URL(string: "iosamap://")!, options: [:], completionHandler: nil)
            }
        }))
        present(ac, animated: true)
    }
}

