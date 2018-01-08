//
//  CurrentWeather.swift
//  theWeather
//
//  Created by Jakub Slawecki on 16.12.2017.
//  Copyright © 2017 Jakub Slawecki. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    // for data security, I use private var
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil{
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())  // Date is data from the device
        self._date = "Today, \(currentDate)" // For the date is a little different, I can choose date style here, such            as .full, .long, .medium etc,
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Int {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        let myDouble = _currentTemp
        let myInt:Int = Int(myDouble!) // that will remove .0 from Double
        //return _currentTemp
        return myInt
        
    }
    
    
    func downloadWeatherDetails(completed: @escaping DownloadCompleted) {
        //Alamofire download
        // let currentWeatherURL = URL(string: CURRENT_WEATHER_URL) I know that CURRENT_WEATHER_URL is an URL
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            //print(response) to check the result of the download
            
            //I set the dictionary to download data from JSON
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized //.capitalized set first letter from small to big one - a->A
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] { //weather[ 0] - it is a number of array
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> { //dictionary without [ ] because it's not array
                    if let temp = main["temp"] as? Double {
                        self._currentTemp = temp
                        print(self._currentTemp)
                    }
                }
            }
            completed()
        }
    }
    
}














