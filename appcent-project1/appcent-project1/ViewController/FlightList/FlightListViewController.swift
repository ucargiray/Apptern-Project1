//
//  FlightListViewController.swift
//  appcent-project1
//
//  Created by Giray Uçar on 9.06.2021.
//

import UIKit

class FlightListViewController: UIViewController {
    
    @IBOutlet var flightsTableView: UITableView!
    
    let cellSpacingHeight: CGFloat = 40
    
    
    var flights : FlightResponse?
    var flightsAPI = FlightAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Flight"
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "openingColor")
        configureTableView()
        getDataUsingAPI()
        let logoutBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutUser))
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
    }
    
    @objc func logoutUser() {
        UserDefaults.standard.removeObject(forKey: "isUserRemember")
        
        let loginViewStoryboard = UIStoryboard(name: "LoginViewController", bundle: nil)
        let loginVC = loginViewStoryboard.instantiateInitialViewController() as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
        UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: loginVC)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func getDataUsingAPI() {
        self.flightsAPI.getFlights { response in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.flights = response
                self.flightsTableView.reloadData()
            }
        }
    }
    
    private func configureTableView() {
        self.flightsTableView.dataSource = self
        self.flightsTableView.delegate = self
    }
    
}

extension FlightListViewController : UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightsListTableViewCell") as? FlightsTableViewCell
        if let cell = cell {
            if let flight = flights , let rowData = flight.data {
                let data = rowData[indexPath.section]
                cell.configure(data: data)
                return cell
            }
            else {
                let cell = UITableViewCell()
                cell.textLabel?.text = "Loading..."
                return cell
            }
        }else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "Loading..."
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let flightDetailVCStoryboard = UIStoryboard(name: "FlightDetailViewController", bundle: nil)
        if let flightDetailVC = flightDetailVCStoryboard.instantiateInitialViewController() as? FlightDetailViewController {
            if let flightsData = flights?.data {
                flightDetailVC.flight = flightsData[indexPath.section]
                self.navigationController?.pushViewController(flightDetailVC, animated: true)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.flights?.data!.count ?? 3
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return cellSpacingHeight
        }
    
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor(named: "backgroundColor")
            return headerView
        }
    
    
}
