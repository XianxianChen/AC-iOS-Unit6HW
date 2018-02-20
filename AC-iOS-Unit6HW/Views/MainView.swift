//
//  FlashCardView.swift
//  AC-iOS-Unit6HW
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class MainView: UIView {

    lazy var userNameLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Hello userName"
        return lab
    }()
    lazy var categoryButton: UIButton = {
        let butt = UIButton()
        butt.setTitle("Select a category", for: .normal)
        butt.backgroundColor = .blue
        return butt
    }()
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "categoryCell")
        return tv
    }()
    lazy var indexLabel: UILabel = {
        let lab = UILabel()
        lab.textAlignment = .center
        lab.text = "1 of 5"
        return lab
    }()
    lazy var cardLabel: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "HelveticaNeue-LightItalic", size: 12)
        lab.text = "Flash card question"
        return lab
    }()
    lazy var checkButton: UIButton = {
       let butt = UIButton()
        butt.setTitle("Check Answer", for: .normal)
        butt.setTitleColor(.black, for: .normal)
          butt.backgroundColor = .lightGray
        return butt
    }()
    lazy var nextButton: UIButton = {
        let butt = UIButton()
        butt.setTitle("Next", for: .normal)
        butt.setTitleColor(.black, for: .normal)
        butt.backgroundColor = .lightGray
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
        addSubview(userNameLabel)
        addSubview(categoryButton)
        addSubview(tableView)
        addSubview(indexLabel)
        addSubview(cardLabel)
        addSubview(checkButton)
        addSubview(nextButton)
        
        userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(15)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(10)
            make.height.equalTo(35)
        }
        categoryButton.snp.makeConstraints { (make) in
            make.top.equalTo(userNameLabel.snp.bottom).offset(10)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(10)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(10)
            make.height.equalTo(35)
        }
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(categoryButton.snp.bottom)
            make.leading.equalTo(categoryButton.snp.leading)
            make.trailing.equalTo(categoryButton.snp.trailing)
            make.height.equalTo(self.safeAreaLayoutGuide.snp.height).multipliedBy(0.5)
        }
        indexLabel.snp.makeConstraints { (make) in
            make.top.equalTo(categoryButton.snp.bottom).offset(15)
            make.leading.equalTo(categoryButton.snp.leading)
            make.trailing.equalTo(categoryButton.snp.trailing)
            make.height.equalTo(30)
        }
        cardLabel.snp.makeConstraints { (make) in
            make.top.equalTo(indexLabel.snp.bottom).offset(5)
            make.leading.equalTo(indexLabel.snp.leading)
            make.trailing.equalTo(indexLabel.snp.trailing)
            make.height.equalTo(self.safeAreaLayoutGuide.snp.height).multipliedBy(0.45)
        }
        checkButton.snp.makeConstraints { (make) in
            make.top.equalTo(cardLabel.snp.bottom).offset(5)
            make.leading.equalTo(cardLabel.snp.leading)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.3)
        }
        nextButton.snp.makeConstraints { (make) in
            make.top.equalTo(checkButton.snp.top)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-10)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.3)
        }
    }
    
    
}
