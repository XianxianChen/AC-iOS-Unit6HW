//
//  CreateFlashCardViewController.swift
//  AC-iOS-Unit6HW
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CreateFlashCardViewController: UIViewController {
    
    let createView = CreateFlashCardView()
    var categories = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = CateoryHelper.manager.getAllCategory()
        setupCreateView()
    }
    
    func setupCreateView() {
        view.addSubview(createView)
        self.createView.tableView.delegate = self
        self.createView.tableView.dataSource = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .done, target: self, action: #selector(submitCard))
        createView.tableView.isHidden = true
        createView.categoryButton.addTarget(self, action: #selector(animateTV), for: .touchUpInside)
    }
    @objc func submitCard() {
        createView.questionTextView.text = ""
        createView.answerTextField.text = ""
    }
    @objc func animateTV() {
        let tv = createView.tableView
        if tv.isHidden {
           tv.isHidden = false
            
           tv.reloadData()
            let cells = tv.visibleCells
            let tableViewHeight = tv.bounds.size.height
            for cell in cells {
                cell.transform = CGAffineTransform(translationX: 0, y: -tableViewHeight)
            }
            var delayCounter = 0
            for cell in cells {
                UIView.animate(withDuration: 2, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.0, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                    cell.transform = CGAffineTransform.identity
                }, completion: nil)
                delayCounter += 1
            }
        } else {
           tv.isHidden = true
        }
        
    }
   
}
extension CreateFlashCardViewController: UITableViewDelegate {
    
}
extension CreateFlashCardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
}
