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
        lab.text = "Hello,"
        lab.font = UIFont(name: "HelveticaNeue-LightItalic", size: 17)
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
       // lab.text = "1 of 5"
        return lab
    }()
    lazy var flashCardView = FlashCardView()
    lazy var questionView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: CGFloat(237.0/255.0), green: CGFloat(166.0/275.0), blue: CGFloat(188.0/275.0), alpha: 1)
        return view
    }()
    lazy var answerView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    lazy var questionLabel: UILabel = {
        let lab = UILabel()
      //  lab.font = UIFont(name: "HelveticaNeue-LightItalic", size: 12)
        lab.numberOfLines = 0
        lab.textAlignment = .center
        lab.text = "Select a category above to start the test."
        lab.backgroundColor = .clear
        return lab
    }()
    lazy var answerLabel: UILabel = {
        let lab = UILabel()
        //  lab.font = UIFont(name: "HelveticaNeue-LightItalic", size: 12)
        lab.numberOfLines = 0
        lab.textAlignment = .center
        lab.backgroundColor = .clear
        return lab
    }()
    lazy var previousButton: UIButton = {
       let butt = UIButton()
        butt.setTitle("Previous", for: .normal)
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
    lazy var checkButton: UIButton = {
        let butt = UIButton()
        butt.setTitle("Flip", for: .normal)
        butt.setTitleColor(.black, for: .normal)
        butt.backgroundColor = .orange
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
        answerView.addSubview(answerLabel)
        questionView.addSubview(questionLabel)
        flashCardView.addSubview(answerView)
        flashCardView.addSubview(questionView)
        addSubview(userNameLabel)
        addSubview(categoryButton)
        addSubview(indexLabel)
        addSubview(flashCardView)
        addSubview(previousButton)
        addSubview(nextButton)
        addSubview(checkButton)
        addSubview(tableView)
        answerLabel.snp.makeConstraints { (make) in
          make.edges.equalToSuperview()
        }
        questionLabel.snp.makeConstraints { (make) in
             make.edges.equalToSuperview()
        }
        answerView.snp.makeConstraints { (make) in
             make.edges.equalToSuperview()
        }
        questionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(15)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(10)
            make.height.equalTo(35)
        }
        categoryButton.snp.makeConstraints { (make) in
            make.top.equalTo(userNameLabel.snp.bottom).offset(10)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(10)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-10)
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
        flashCardView.snp.makeConstraints { (make) in
            make.top.equalTo(indexLabel.snp.bottom).offset(5)
            make.leading.equalTo(indexLabel.snp.leading)
            make.trailing.equalTo(indexLabel.snp.trailing)
            make.height.equalTo(self.safeAreaLayoutGuide.snp.height).multipliedBy(0.45)
        }
        previousButton.snp.makeConstraints { (make) in
            make.top.equalTo(flashCardView.snp.bottom).offset(8)
            make.leading.equalTo(flashCardView.snp.leading)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.3)
        }
        nextButton.snp.makeConstraints { (make) in
            make.top.equalTo(previousButton.snp.top)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-10)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.3)
        }
        checkButton.snp.makeConstraints { (make) in
          make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-20)
          make.centerX.equalToSuperview()
          make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.3)
        }
    }
    
    
}
