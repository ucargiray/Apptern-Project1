//
//  FlightData.swift
//  appcent-project1
//
//  Created by Giray Uçar on 13.06.2021.
//

import Foundation

struct FlightData : Decodable {
    
    var flightDate : String?
    var flightStatus : FlightStatus?
    var departure : Departure?
    var arrival : Arrival?
    var airline : Airline?
    var flight : Flight?
    
    enum FlightStatus : String , Decodable {
        case active
        case cancelled
        case scheduled
    }
    
    enum CodingKeys : String , CodingKey {
        case flightDate = "flight_date"
        case flightStatus = "flight_status"
        case departure , arrival , airline , flight
    }
}
