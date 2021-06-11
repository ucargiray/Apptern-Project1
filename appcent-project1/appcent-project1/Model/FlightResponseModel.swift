//
//  FlightsListModel.swift
//  appcent-project1
//
//  Created by Giray Uçar on 9.06.2021.
//


import Foundation

struct Pagination : Decodable {
    var limit , offset , count , total : Int?
}

struct FlightResponse : Decodable {
    var pagination : Pagination?
    var data : [FlightData]?
}

enum FlightStatus : String , Decodable {
    case active
    case cancelled
    case scheduled
}

struct FlightData : Decodable {
    var flight_date : String?
    var flight_status : FlightStatus?
    var departure : Departure?
    var arrival : Arrival?
    var airline : Airline?
    var flight : Flight?
}

struct Departure : Decodable {
    var airport , timezone , iata , icao , terminal , gate , scheduled, estimated , actual , estimated_runway , actual_runway : String?
    var delay : Int?
}

struct Arrival : Decodable {
    var airport , timezone , iata , icao , terminal , gate , baggage , scheduled , estimated , actual , estimated_runway , actual_runway : String?
    var delay : Int?
}

struct Airline : Decodable {
    var name , iata , icao : String?
}

struct Flight : Decodable {
    var number , iata , icao  : String?
}


