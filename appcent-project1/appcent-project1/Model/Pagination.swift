//
//  Pagination.swift
//  appcent-project1
//
//  Created by Giray Uçar on 13.06.2021.
//

import Foundation

struct Pagination : Decodable {
    var limit , offset , count , total : Int?
    
    enum CodingKeys : String , CodingKey {
        case limit , offset , count , total
    }
    
}
