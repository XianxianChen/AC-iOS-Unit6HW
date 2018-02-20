//
//  CreateAccoutViewController.swift
//  AC-iOS-Unit6HW
//
//  Created by C4Q on 2/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CreateAccoutViewController: UIViewController {
    let createView = CreateNewAccountView()
    override func viewDidLoad() {
        super.viewDidLoad()
       view.addSubview(createView)
        configureCreateView()
    }
    func configureCreateView() {
        createView.alreadyHaveAcctButton.addTarget(self, action: #selector(backtoLogin), for: .touchUpInside)
        createView.createAcctButton.addTarget(self, action: #selector(createNewAccout), for: .touchUpInside)
    }
    @objc func backtoLogin() {
        dismiss(animated: true, completion: nil)
    }
    @objc func createNewAccout() {
        guard let userName = createView.userNameTF.text, userName != "", let email = createView.emailTextField.text, email != "", let password = createView.passwordTextField.text, password != "" else {return}
        FirebaseAPIClient.manager.creatNewAccout(email: email, password: password, displayName: userName)
    }
  
    

}
