//
//  Location.swift
//  theWeather
//
//  Created by Jakub Slawecki on 04.01.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() { }

    var latitude: Double!
    var longitude: Double!
    
    

}
