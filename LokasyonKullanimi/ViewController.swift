//
//  ViewController.swift
//  LokasyonKullanimi
//
//  Created by Beyza Karadeniz on 8.01.2022.
//

import UIKit
import CoreLocation
import MapKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet weak var enlemLabel: UILabel!
    @IBOutlet weak var boylamLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var gmsMapView: GMSMapView!
    
    var lm = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
            
        lm.desiredAccuracy = kCLLocationAccuracyBest
        lm.delegate = self
        lm.requestWhenInUseAuthorization()
        lm.startUpdatingLocation()
        let konum = CLLocationCoordinate2D(latitude: 41.0370176, longitude: 28.9763369)
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let bolge = MKCoordinateRegion(center: konum, span: span)
        mapView.setRegion(bolge, animated: true)
        
        let pin =  MKPointAnnotation()
        pin.coordinate = konum
        pin.title = "Taksim"
        pin.subtitle = "Taksim Meydan"
        mapView.addAnnotation(pin)
        
        let camera = GMSCameraPosition.camera(withLatitude: 41.0370176, longitude: 28.9763369, zoom: 15.0)
        gmsMapView.camera = camera
        
        
       let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 41.0370176, longitude: 28.9763369)
        marker.title = "Taksim"
        marker.snippet = "Taksim Meydan"
        marker.map = gmsMapView
    }


}

extension ViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let sonKonum = locations[locations.count-1]
        enlemLabel.text = "Enlem : \(sonKonum.coordinate.latitude)"
        boylamLabel.text = "Boylam : \(sonKonum.coordinate.longitude)"
    }
}
