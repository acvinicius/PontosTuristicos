//
//  InfoPoi.swift
//  PontosTuristicos
//
//  Created by Vinicius Araujo Castro on 08/08/17.
//  Copyright © 2017 Vinicius Araujo Castro. All rights reserved.
//

import Foundation

class InfoPoi {
    
    var name : String!
    var address : String!
    var latitude : Double!
    var longitude : Double!
    
    init(name:String, address:String, latitude:Double, longitude:Double) {
        self.name = name
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
    }
}
