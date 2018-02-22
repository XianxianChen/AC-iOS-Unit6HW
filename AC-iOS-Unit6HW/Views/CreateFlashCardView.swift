//
//  CreateFlashCardView.swift
//  AC-iOS-Unit6HW
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
class CreateFlashCardView: UIView {
    lazy var questionLabel: UILabel = {
        let lab = UILabel()
        lab.contentMode = .center
        lab.text = "Question:"
        return lab
    }()
    lazy var questionTextView: UITextView = {
       let tv = UITextView()
        tv.text = "Enter question here"
        tv.layer.borderWidth = 0.2
        tv.layer.borderColor = UIColor.gray.cgColor
        return tv
    }()
    lazy var answerLabel: UILabel = {
        let lab = UILabel()
        lab.contentMode = .center
        lab.text = "Answer:"
        return lab
    }()
    lazy var answerTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter answer here"
        tf.layer.borderWidth = 0.2
        tf.layer.borderColor = UIColor.gray.cgColor
        return tf
    }()
    lazy var categoryButton: UIButton = {
        let butt = UIButton()
        butt.setTitle("Select a category", for: .normal)
        butt.backgroundColor = .blue
        return butt
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "categoryCell")
        return tableView
    }()

    lazy var createCateLabel: UILabel = {
        let lab = UILabel()
        lab.textAlignment = .center
        lab.text = "-- Or Create your own category --"
        lab.textColor = .blue
        return lab
    }()
    lazy var createCateTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter a new category"
        tf.layer.borderWidth = 0.2
        tf.layer.borderColor = UIColor.gray.cgColor
        return tf
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
       setupViews()
    }
    private func setupViews() {
        backgroundColor = .white
        setupConstraints()
    }
    private func setupConstraints() {
        addSubview(questionLabel)
        addSubview(questionTextView)
        addSubview(answerLabel)
        addSubview(answerTextField)
        addSubview(categoryButton)
        addSubview(createCateLabel)
        addSubview(createCateTF)
        addSubview(tableView)
        
        questionLabel.snp.makeConstraints { (make) in
         make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(15)
         make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(10)
         make.height.equalTo(35)
        }
        questionTextView.snp.makeConstraints { (make) in
            make.top.equalTo(questionLabel.snp.bottom).offset(10)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(10)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-10)
            make.height.equalTo(self.safeAreaLayoutGuide.snp.height).multipliedBy(0.3)
        }
        answerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(questionTextView.snp.bottom).offset(10)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(10)
            make.height.equalTo(35)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.25)
        }
        answerTextField.snp.makeConstraints { (make) in
            make.top.equalTo(answerLabel.snp.top)
            make.leading.equalTo(answerLabel.snp.trailing)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-10)
            make.height.equalTo(35)
        }
        categoryButton.snp.makeConstraints { (make) in
            make.top.equalTo(answerTextField.snp.bottom).offset(10)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(10)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-10)
            make.height.equalTo(35)
        }
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(categoryButton.snp.bottom)
            make.leading.equalTo(categoryButton.snp.leading)
            make.trailing.equalTo(categoryButton.snp.trailing)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
        createCateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(categoryButton.snp.bottom).offset(10)
            make.leading.equalTo(categoryButton.snp.leading)
            make.trailing.equalTo(categoryButton.snp.trailing)
            make.height.equalTo(30)
        }
        createCateTF.snp.makeConstraints { (make) in
            make.top.equalTo(createCateLabel.snp.bottom).offset(10)
            make.leading.equalTo(createCateLabel.snp.leading)
            make.trailing.equalTo(createCateLabel.snp.trailing)
            make.height.equalTo(35)
        }
        
    }
    
   
   
}
