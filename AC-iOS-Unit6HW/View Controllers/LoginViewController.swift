//
//  ViewController.swift
//  AC-iOS-Unit6HW
//
//  Created by C4Q on 2/15/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import CoreData
import Firebase

class LoginViewController: UIViewController {
     let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
        loginView.emailTextField.delegate = self
        loginView.passwordTextField.delegate = self
        configureLoginViews()
        
    }
    func configureLoginViews() {
        loginView.createNewAccountButton.addTarget(self, action: #selector(showCreateAccoutVC), for: .touchUpInside)
        loginView.loginButton.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
    }
  
    @objc func loginUser() {
        guard let email = loginView.emailTextField.text, email != "", let password = loginView.passwordTextField.text, password != "" else {return}
        FirebaseAPIClient.manager.loginUser(email: email, password: password)
       // navigationController?.modalTransitionStyle = .coverVertical
      //  navigationController?.modalPresentationStyle = .overCurrentContext
       // navigationController?.pushViewController(MainViewController(), animated: true)
        let narVC = UINavigationController(rootViewController: MainViewController())
        present(narVC, animated: true, completion: nil)
    }
    @objc func showCreateAccoutVC() {
        present(CreateAccoutViewController(), animated: true, completion: nil)
    }
   
   


}
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

