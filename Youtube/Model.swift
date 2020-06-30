//
//  Model.swift
//  Youtube
//
//  Created by Erdem Koçer on 30.06.2020.
//

import Foundation



class Model {
    func getVideos() {
        
        //Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else { return }
        
        //Get a URL Session object
        let session = URLSession.shared
        
        //Get a datatask from the URL Session object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            //Parsing the data to video objects.
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                dump(response)
            } catch {
                print(error)
            }
            
            
            
        }
        
        //Kick off the task
        
        dataTask.resume()
        
        
    }
}
