//
//  Flight.swift
//  appcent-project1
//
//  Created by Giray Uçar on 13.06.2021.
//

import Foundation

struct Flight : Decodable {
    var number , iata , icao  : String?
    
    enum CodingKeys : String , CodingKey {
        case number , iata , icao
    }
}
