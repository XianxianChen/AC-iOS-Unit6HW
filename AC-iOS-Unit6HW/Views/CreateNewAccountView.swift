//
//  CreateNewAccountView.swift
//  AC-iOS-Unit6HW
//
//  Created by C4Q on 2/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CreateNewAccountView: UIView {

    lazy var welcomeLabel: UILabel = {
     let label = UILabel()
        label.textAlignment = .center
        label.text = "Welcome to join us!"
        label.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 20)
        return label
    }()
    lazy var userNameTF: UITextField = {
        let utf = UITextField()
        utf.placeholder = "Enter your user name"
        utf.layer.borderColor = UIColor.gray.cgColor
        utf.layer.borderWidth = 0.2
        return utf
    }()
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
    lazy var createAcctButton: UIButton = {
        let butt = UIButton()
        butt.setTitle("Create account", for: .normal)
        butt.backgroundColor = .blue
        return butt
    }()
    lazy var alreadyHaveAcctButton: UIButton = {
        let butt = UIButton()
        butt.setTitle("Already have an account?", for: .normal)
        butt.setTitleColor(.blue, for: .normal)
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
        setupViews()
    }
    private func setupViews() {
        setupConstraints()
    }
    private func setupConstraints() {
        addSubview(welcomeLabel)
        addSubview(userNameTF)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(createAcctButton)
        addSubview(alreadyHaveAcctButton)
        
        
        //welcome label
        welcomeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(40)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.9)
        }
        
       
        userNameTF.snp.makeConstraints { (make) in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(30)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.8)
            make.height.equalTo(40)
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(userNameTF.snp.bottom).offset(20)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.8)
            make.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.8)
            make.height.equalTo(40)
        }
        
        //login button
        createAcctButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.8)
            make.height.equalTo(30)
        }
      alreadyHaveAcctButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.8)
            make.height.equalTo(30)
        }
        
    }
    
}
