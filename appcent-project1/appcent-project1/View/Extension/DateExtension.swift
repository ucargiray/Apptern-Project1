//
//  DateExtension.swift
//  appcent-project1
//
//  Created by Giray Uçar on 11.06.2021.
//

import Foundation


extension Date {
    func getFormattedDate(format:String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.string(from: self)
    }
}
