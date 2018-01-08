//
//  Constants.swift
//  theWeather
//
//  Created by Jakub Slawecki on 16.12.2017.
//  Copyright © 2017 Jakub Slawecki. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "437eacd7051e5f0415285e3641bd8e84"
let METRIC = "&units=metric" //changing units from ferrinhait to metric system
let FORECAST_BASE_URL = "http://api.openweathermap.org/data/2.5/forecast?"

// That ll tell my function that it completed downloading files
typealias DownloadCompleted = () -> ()



let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)\(METRIC)"


let FORECAST_URL = "\(FORECAST_BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)\(METRIC)"





