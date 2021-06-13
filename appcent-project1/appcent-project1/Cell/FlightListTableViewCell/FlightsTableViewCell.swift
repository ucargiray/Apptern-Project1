//
//  FlightsTableViewCell.swift
//  appcent-project1
//
//  Created by Giray Uçar on 9.06.2021.
//

import UIKit

class FlightsTableViewCell: UITableViewCell {
    
  
    @IBOutlet var delayLabel: UILabel!
    @IBOutlet var airPortLabel: UILabel!
    @IBOutlet var arrivalTimeLabel: UILabel!
    @IBOutlet var departureTimeLabel: UILabel!
    @IBOutlet var statusView: UIView!
    var arrivalDate : String?
    var estimatedDate : String?
    
    
    private func formatDate(data : FlightData) {
        if let dateComponents1 = data.departure?.estimated?.components(separatedBy: "-") {
            let hourComponent1 = dateComponents1[2]
            self.arrivalDate = hourComponent1
        }
        if let dateComponents2 = data.arrival?.estimated?.components(separatedBy: "-") {
            let hourComponent2 = dateComponents2[2]
            self.estimatedDate = hourComponent2
        }
    }
    
    private func formatHour() {
        let arrivalDate = self.arrivalDate?.components(separatedBy: "+")[0]
        let estimatedDate = self.estimatedDate?.components(separatedBy: "+")[0]
        self.arrivalDate = String((arrivalDate?.dropFirst(3))!)
        self.estimatedDate = String((estimatedDate?.dropFirst(3))!)
        self.arrivalDate = String((self.arrivalDate?.dropLast(3))!)
        self.estimatedDate = String((self.estimatedDate?.dropLast(3))!)
    }
    
    
    func configure(data : FlightData?) {
        if let data = data {
            statusView.layer.cornerRadius = 10
            airPortLabel.text = data.airline?.name
            formatDate(data: data)
            formatHour()
            delayLabel.text = "\(data.departure?.delay ?? 0) mi"
            arrivalTimeLabel.text = "\(data.departure!.icao ?? "") - \(self.arrivalDate ?? "")"
            departureTimeLabel.text = "\(data.arrival!.icao ?? "") - \(self.estimatedDate ?? "")"
            
            switch data.flightStatus {
            case .active:
                statusView.backgroundColor = UIColor.green
            case .cancelled:
                statusView.backgroundColor = UIColor.red
            case .scheduled:
                statusView.backgroundColor = UIColor.yellow
            default:
                statusView.backgroundColor = UIColor.white
            }
        }
        else {
            print("Unable to make detail page")
        }
        
    }
}
