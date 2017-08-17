//
//  PoiAnnotation.swift
//  PontosTuristicos
//
//  Created by Vinicius Araujo Castro on 08/08/17.
//  Copyright © 2017 Vinicius Araujo Castro. All rights reserved.
//

import Foundation
import MapKit

class PoiAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
