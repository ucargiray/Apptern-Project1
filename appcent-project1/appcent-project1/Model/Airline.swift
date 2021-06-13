//
//  Airline.swift
//  appcent-project1
//
//  Created by Giray Uçar on 13.06.2021.
//

import Foundation


struct Airline : Decodable {
    var name , iata , icao : String?
    
    enum CodingKeys : String , CodingKey {
        case name , iata , icao
    }
}
