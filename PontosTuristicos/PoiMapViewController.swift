//
//  PoiMapViewController.swift
//  PontosTuristicos
//
//  Created by Vinicius Araujo Castro on 08/08/17.
//  Copyright © 2017 Vinicius Araujo Castro. All rights reserved.
//

import UIKit
import MapKit

class PoiMapViewController : UIViewController, CLLocationManagerDelegate, MKMapViewDelegate  {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var poi : InfoPoi!
    lazy var locationManager = CLLocationManager()
    var poiAnnotations: [MKPointAnnotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
        requestLocation()
        
        mapView.mapType = MKMapType.standard
        mapView.delegate = self
        if poi != nil {
            self.showPoi()
            //Definindo região a ser mostrada
            let region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: poi.latitude, longitude: poi.longitude), 500, 500)
            mapView.setRegion(region, animated: true)
            self.navigationItem.title = poi.name
        }
        
        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
        
    }
    
    // MARK: - Methods
    func requestLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
            switch CLLocationManager.authorizationStatus() {
            case .authorizedWhenInUse, .authorizedAlways:
                print("Usuário já autorizou!")
                locationManager.startUpdatingLocation()
            case .notDetermined:
                print("Usuário ainda não autorizou")
                locationManager.requestWhenInUseAuthorization()
            case .denied:
                print("Usuário negou autorização!")
            case .restricted:
                print("O acesso ao GPS está bloqueado nesse device")
            }
        }
    }

    func showPoi() {
        let coordinate = CLLocationCoordinate2D(latitude: poi.latitude, longitude: poi.longitude)
        let annotation = PoiAnnotation(coordinate: coordinate)
        annotation.coordinate = coordinate
        annotation.title = poi.name
        annotation.subtitle = poi.address
        mapView.addAnnotation(annotation)
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
    
}
