//
//  FlightAPI.swift
//  appcent-project1
//
//  Created by Giray Uçar on 9.06.2021.
//

import Foundation

class FlightAPI {
    
    func getFlights(completionHandler: @escaping ((FlightResponse) -> Void)) {
        guard let url = URL(string: Constant.baseURL + Constant.search + Constant.apiKey) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedModel = try decoder.decode(FlightResponse.self, from: data)
                    DispatchQueue.main.async {
                        completionHandler(decodedModel)
                    }
                }
                catch {
                    print(error)
                }
                
            } else {
                print("Data gelmedi")
            }
        }.resume()
    }
    
}
