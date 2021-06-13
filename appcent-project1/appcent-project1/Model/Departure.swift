//
//  Departure.swift
//  appcent-project1
//
//  Created by Giray Uçar on 13.06.2021.
//

import Foundation


struct Departure : Decodable {
    var airport , timezone , iata , icao , terminal , gate , scheduled, estimated , actual , estimatedRunway , actualRunway : String?
    var delay : Int?
    
    enum CodingKeys : String , CodingKey {
        case estimatedRunway = "estimated_runway"
        case actualRunway = "actual_runway"
        case airport , timezone , iata , icao , terminal , gate , scheduled , estimated , actual
        case delay
    }
}
