//
//  FlightsListModel.swift
//  appcent-project1
//
//  Created by Giray Uçar on 9.06.2021.
//

import Foundation


struct FlightResponse : Decodable {
    var pagination : Pagination?
    var data : [FlightData]?
}


