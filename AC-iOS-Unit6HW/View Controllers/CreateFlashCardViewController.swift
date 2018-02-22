//
//  CreateFlashCardViewController.swift
//  AC-iOS-Unit6HW
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import FirebaseAuth

class CreateFlashCardViewController: UIViewController {
    
    let createView = CreateFlashCardView()
    var categories = [String]() {
        didSet {
            createView.tableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = CateoryHelper.manager.getAllCategory()
        setupCreateView()
    }
    
    func setupCreateView() {
        view.addSubview(createView)
        self.createView.tableView.delegate = self
        self.createView.tableView.dataSource = self
        createView.questionTextView.delegate = self
        createView.answerTextField.delegate = self
        createView.createCateTF.delegate = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .done, target: self, action: #selector(submitCard))
        createView.tableView.isHidden = true
        createView.categoryButton.addTarget(self, action: #selector(animateTV), for: .touchUpInside)
    
    }
    @objc func submitCard() {
        // reset tf and tv to empty
         let newQuestion = createView.questionTextView.text
        guard !newQuestion!.isEmpty, newQuestion != "Enter question here" else {
            showAlert(title: "No question", message: "The question can not be empty, please enter a question")
            return
        }
        let newAnswer = createView.answerTextField.text
        guard newAnswer != nil,  newAnswer != "" else {
            showAlert(title: "No answer", message: "The answer can not be empty, please enter an answer")
            return
        }
        let newCategory = createView.categoryButton.title(for: .normal)
        guard newCategory != "Select a category" else {
            showAlert(title: "NO category", message: "Please select a category Or create one")
            return}
        FlashCardService.manager.createFlashCard(question: newQuestion!, answer: newAnswer!, userID: Auth.auth().currentUser!.uid, category: newCategory!)
        showAlert(title: "Success", message: "You've created a flash card")
        
        createView.questionTextView.text = "Enter question here"
        createView.answerTextField.text = ""
        createView.createCateTF.text = ""
        createView.categoryButton.setTitle("Select a category", for: .normal)
        
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
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
   
}
extension CreateFlashCardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCategory = categories[indexPath.row]
        self.createView.categoryButton.setTitle(selectedCategory, for: .normal)
        createView.tableView.isHidden = true
        self.createView.createCateTF.text = ""
    }
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
extension CreateFlashCardViewController: UITextFieldDelegate, UITextViewDelegate {
  
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard textField.text != nil, textField.text != "" else {return false}
        
       if textField == createView.createCateTF {
            let newCategory = textField.text!
            self.createView.categoryButton.setTitle(newCategory, for: .normal)
            CateoryHelper.manager.addToCategory(newItem: newCategory)
            self.categories = CateoryHelper.manager.getAllCategory()
        }
        textField.resignFirstResponder()
        return true
    }
    
    
}
