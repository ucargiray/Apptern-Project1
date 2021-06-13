//
//  LoginViewController.swift
//  appcent-project1
//
//  Created by Giray Uçar on 9.06.2021.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var rememberMeSwitch: UISwitch!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLoginButton()
        self.navigationController?.navigationBar.isHidden = true
        self.hideKeyboardWhenTappedAround()
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    func configureLoginButton () {
        self.loginButton.layer.cornerRadius = 15
        self.loginButton.layer.backgroundColor = UIColor(named: "buttonColor")?.cgColor
    }
    
    private func navigateToFlighListVC() {
        let flightListStoryboard = UIStoryboard(name: "FlightListViewController", bundle: nil)
        if let flightListVC = flightListStoryboard.instantiateInitialViewController() as? FlightListViewController {
            self.navigationController?.pushViewController(flightListVC, animated: true)
            UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: flightListVC)
        }
    }
    
    private func openFlightListPage() {
        let flightListStoryboard = UIStoryboard(name: "FlightListViewController", bundle: nil)
        if let flightListVC = flightListStoryboard.instantiateInitialViewController() as? FlightListViewController {
            self.navigationController?.pushViewController(flightListVC, animated: true)
            UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: flightListVC)
        }
    }
    
    private func getUsersData() {
        if let password = self.passwordTextField.text ,let email = self.emailTextField.text {
            
            if password == "123456" && email == "appcent@appcent.mobi" {
                if self.rememberMeSwitch.isOn {
                    self.saveUserData()
                }
                self.openFlightListPage()
            }
            
            else {
             createAlert(message: "Bilgileriniz hatalıdır. Lütfen bilgilerinizi kontrol ediniz.")
            }
        }
    }
    
    private func createAlert(message : String) {
        let alertController = UIAlertController(title: "User not found", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        getUsersData()
    }
    
    private func saveUserData() {
        UserDefaults.standard.set(true, forKey: "isUserRemember")
    }
    
}

extension LoginViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
