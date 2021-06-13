//
//  FlightDetailViewController.swift
//  appcent-project1
//
//  Created by Giray Uçar on 9.06.2021.
//

import UIKit

class FlightDetailViewController: UIViewController {
    
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    
    var flight = FlightData()
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    @IBOutlet var gateLabel: UILabel!
    @IBOutlet var terminalLabel: UILabel!
    @IBOutlet var flightLabel: UILabel!
    @IBOutlet var date2Label: UILabel!
    @IBOutlet var date1Label: UILabel!
    @IBOutlet var airPort2Description2Label: UILabel!
    @IBOutlet var airPort1Description1Label: UILabel!
    @IBOutlet var airPortLabel2: UILabel!
    @IBOutlet var airPortLabel1: UILabel!
    
    
    @IBOutlet var closePageImageView: UIImageView!
    
    var formatedArrivalDate = Date()
    var formatedDepartureDate = Date()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.layer.cornerRadius = 10
        view2.layer.cornerRadius = 10
    }
    
    
    private func formatDateUsingDateFormatter() {
        let arrivalFlightDate = self.flight.arrival?.estimated
        let departureFlightDate = self.flight.departure?.estimated

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        self.formatedArrivalDate = dateFormatter.date(from:arrivalFlightDate!)!
        self.formatedDepartureDate = dateFormatter.date(from: departureFlightDate!)!
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
        formatDateUsingDateFormatter()
        configureTopLabels()
        configureBottomLabels()
        
        configureCloseImageView()
        
    }
    
   private func configureCloseImageView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.closePage))
        closePageImageView.isUserInteractionEnabled = true
        closePageImageView.addGestureRecognizer(tap)
    }
    
    private func configureTopLabels() {
        airPortLabel1.text = flight.departure?.icao
        airPortLabel2.text = flight.arrival?.icao
        airPort1Description1Label.text = flight.departure?.airport
        airPort2Description2Label.text = flight.arrival?.airport
        
        date2Label.text = "\(formatedArrivalDate.getFormattedDate(format: "E, MMM d"))\n \(formatedArrivalDate.getFormattedDate(format: "h:mm a"))"
        
        date1Label.text = "\(formatedDepartureDate.getFormattedDate(format: "E, MMM d"))\n \(formatedDepartureDate.getFormattedDate(format: "h:mm a"))"
        
    }
    
    private func configureBottomLabels() {
        titleLabel.text = "\(flight.flight?.iata ?? "") Details"
        if let delay = flight.departure?.delay {
            delayLabel.text = "\(delay)"
        }else {
            delayLabel.text = "No data"
        }
        gateLabel.text = flight.departure?.gate ?? "No data"
        terminalLabel.text = flight.departure?.terminal ?? "No data"
        flightLabel.text = flight.flight?.iata ?? "No data"
        
    }
    
    @objc func closePage() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
