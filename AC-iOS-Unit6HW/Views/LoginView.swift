//
//  LoginView.swift
//  AC-iOS-Unit6HW
//
//  Created by C4Q on 2/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class LoginView: UIView {

 
        lazy var welcomeLabel: UILabel = {
            let label = UILabel()
            label.text = "Welcome to Flashcard Challege"
            label.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 20)
            label.textAlignment = .center
            return label
        }()
        
        // Email Textfield with Placeholder Text
        lazy var emailTextField: UITextField = {
            let etf = UITextField()
            etf.placeholder = "Enter your E-mail"
            etf.layer.borderColor = UIColor.gray.cgColor
            etf.layer.borderWidth = 0.2
            return etf
        }()
    
        lazy var passwordTextField: UITextField = {
            let ptf = UITextField()
            ptf.placeholder = "Enter your password"
            ptf.layer.borderColor = UIColor.gray.cgColor
            ptf.layer.borderWidth = 0.2
            return ptf
        }()
        
        // Login Button - Check credentials via Firebase, then segue to HomePageVC
        lazy var loginButton: UIButton = {
            let butt = UIButton()
            butt.setTitle("Log In", for: .normal)
            butt.backgroundColor = .blue
            //butt.setTitleColor(.red, for: .normal)
            return butt
        }()
        
        // Forgot Password? Button - colored link - Present ForgotPassView
        lazy var forgotPassButton: UIButton = {
            let butt = UIButton ()
            butt.setTitle("Forgot Password?", for: .normal)
            butt.setTitleColor(.red, for: .normal)
            return butt
        }()
        
        // Create New Account Button - Segue to CreateAccountVC
        lazy var createNewAccountButton: UIButton = {
            let butt = UIButton()
            butt.setTitle("Create New Account", for: .normal)
             butt.backgroundColor = .blue
            return butt
        }()
        
        override init(frame: CGRect) {
            super.init(frame: UIScreen.main.bounds)
            commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        private func commonInit() {
            backgroundColor = .white
            setUpViews()
        }
        
        private func setUpViews() {
            setupSubviews()
            setupConstraints()
        }
        
        private func setupSubviews() {
            addSubview(welcomeLabel)
            addSubview(emailTextField)
            addSubview(passwordTextField)
            addSubview(loginButton)
            addSubview(forgotPassButton)
            addSubview(createNewAccountButton)
        }
        
        private func setupConstraints() {
            
            //welcome label
            welcomeLabel.snp.makeConstraints { (make) in
                make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(40)
                make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
                make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.9)
            }
            
            //email textfield
            emailTextField.snp.makeConstraints { (make) in
                make.top.equalTo(welcomeLabel.snp.bottom).offset(30)
                make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
                make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.8)
                make.height.equalTo(40)
            }
            
            //password textfield
            passwordTextField.snp.makeConstraints { (make) in
                make.top.equalTo(emailTextField.snp.bottom).offset(20)
                make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
                make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.8)
                make.height.equalTo(40)
            }
            
            //login button
            loginButton.snp.makeConstraints { (make) in
                make.top.equalTo(passwordTextField.snp.bottom).offset(20)
                make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
                make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.8)
                make.height.equalTo(30)
            }
            
            //forgot password button
            forgotPassButton.snp.makeConstraints { (make) in
                make.top.equalTo(loginButton.snp.bottom).offset(10)
                make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            }
            
            //create account button
            createNewAccountButton.snp.makeConstraints { (make) in
                make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-20)
                make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
                make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.8)
                make.height.equalTo(30)
            }
        }
    


}
