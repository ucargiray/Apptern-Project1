//
//  ViewController.swift
//  appcent-project1
//
//  Created by Giray Uçar on 9.06.2021.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        redirectPage()
    }
    
    func redirectPage() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            if self.checkUserLoginStatus() {
               self.openFlightListPage()
            }
            else {
                self.openLoginPage()
            }
    
        })
    }
    
    private func openLoginPage() {
        let loginViewStoryboard = UIStoryboard(name: "LoginViewController", bundle: nil)
        let loginVC = loginViewStoryboard.instantiateInitialViewController() as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
        UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: loginVC)
    }
    
    private func openFlightListPage() {
        let flightListStoryboard = UIStoryboard(name: "FlightListViewController", bundle: nil)
        if let flightListVC = flightListStoryboard.instantiateInitialViewController() as? FlightListViewController {
            self.navigationController?.pushViewController(flightListVC, animated: true)
            UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: flightListVC)
        }
    }
    
    private func checkUserLoginStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: "isUserRemember")
    }

}

