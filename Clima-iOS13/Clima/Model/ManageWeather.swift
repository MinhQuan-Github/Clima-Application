//
//  ManageWeather.swift
//  Clima
//
//  Created by Quan's Macbook on 05/01/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit

struct ManageWeather {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=27641f36eb61f2588881c0c6b39ffc63&units=metric"
    
    func fetchWeather(cityName : String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString : String) {
        // create url
        if let url = URL(string: urlString) {
            // create url session
            let session = URLSession(configuration: .default)
            // give the session a task
            let task = session.dataTask(with: url, completionHandler: handler(data:response:error:))
            // start the task
            task.resume()
        }
    }
    
    func handler(data : Data? , response : URLResponse? , error : Error?){
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
