//
//  MainViewController.swift
//  AC-iOS-Unit6HW
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class MainViewController: UIViewController {

    let mainView = MainView()
    var categories = [String]()
    var currentIndex = 0
 
    var cardsInCategory = [FlashCard]() {
        didSet {
            self.currentIndex = 0
            guard !cardsInCategory.isEmpty else {
                mainView.indexLabel.text = "0 of 0"
                mainView.questionLabel.text = "There is no flash card in this category yet, click the 'Create' button to create one."
                mainView.checkButton.isHidden = true
                return
            }
             mainView.checkButton.isHidden = false
            mainView.indexLabel.text = "1 of \(cardsInCategory.count)"
            mainView.questionLabel.text = cardsInCategory[currentIndex].question
            mainView.answerLabel.text = cardsInCategory[currentIndex].answer
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.flashCardView.delegate = self
        mainView.flashCardView.duration = 1.5
        mainView.flashCardView.flipAnimation = .flipFromLeft
        categories = CateoryHelper.manager.getAllCategory()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         categories = CateoryHelper.manager.getAllCategory()
        currentIndex = 0
    }
    func setupMainView() {
        view.addSubview(mainView)
        mainView.tableView.isHidden = true
        mainView.checkButton.isHidden = true
        mainView.userNameLabel.text = "Hello, \(Auth.auth().currentUser!.displayName!)"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(showCreateVC))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(signOut))
        mainView.categoryButton.addTarget(self, action: #selector(animateTV), for: .touchUpInside)
        mainView.previousButton.addTarget(self, action: #selector(previousButtonPressed), for: .touchUpInside)
        mainView.nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        mainView.checkButton.addTarget(self, action: #selector(checkButtonPressed), for: .touchUpInside)
    }
    @objc func showCreateVC() {
        navigationController?.modalTransitionStyle = .crossDissolve
        navigationController?.modalPresentationStyle = .overCurrentContext
        navigationController?.pushViewController(CreateFlashCardViewController(), animated: true)
    }
    @objc func signOut() {
        do {
         try Auth.auth().signOut()
        } catch {
            print("Sign out error: \(error)")
        }
        present(LoginViewController(), animated: true, completion: nil)
    }
    @objc func previousButtonPressed() {
        guard currentIndex > 0 else {return}
        currentIndex -= 1
        mainView.indexLabel.text = "\(currentIndex + 1) of \(cardsInCategory.count)"
        mainView.questionLabel.text = cardsInCategory[currentIndex].question
         mainView.answerLabel.text = cardsInCategory[currentIndex].answer
        mainView.flashCardView.showFront = true
        mainView.flashCardView.setupFrontAndBackView()
    }
    @objc func nextButtonPressed() {
        guard currentIndex < cardsInCategory.count - 1 else {return}
        currentIndex += 1
        print("=====================")
        print(currentIndex)
        mainView.indexLabel.text = "\(currentIndex + 1) of \(cardsInCategory.count)"
        mainView.questionLabel.text = cardsInCategory[currentIndex].question
        mainView.answerLabel.text = cardsInCategory[currentIndex].answer
        mainView.flashCardView.showFront = true
        mainView.flashCardView.setupFrontAndBackView()
    }
    @objc func checkButtonPressed() {
           // animateFlashCard()
        mainView.flashCardView.flip()
        
    }
    @objc func animateTV() {
        let tv = mainView.tableView
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
                UIView.animate(withDuration: 1.25, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.0, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                    cell.transform = CGAffineTransform.identity
                }, completion: nil)
                delayCounter += 1
            }
        } else {
            tv.isHidden = true
        }
    }

 

}
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCategory = categories[indexPath.row]
        mainView.categoryButton.setTitle(selectedCategory, for: .normal)
        mainView.tableView.isHidden = true
        mainView.flashCardView.showFront = true
        mainView.flashCardView.setupFrontAndBackView()
    // loadCards in the selected category
        FlashCardService.manager.getFlashCards(from: selectedCategory) { (cards, error) in
            if let error = error {
                print(error)
            }
            if let onlineCards = cards {
                self.cardsInCategory = onlineCards
            }
        }
    
       
    }
}
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
}

extension MainViewController: FlashCardDelegate {
    func flipFrontView(forFlashCard flashCardView: FlashCardView) -> UIView {
        return mainView.questionView
    }
    
    func flipBackView(forFlashCard flashCardView: FlashCardView) -> UIView {
        return mainView.answerView
    }
    func flashCardDidFlip(forFlashCard flashCardView: FlashCardView) {
        print("flash card flipped")
    }
    func flashCardWillFlip(forFlashCard flashCardView: FlashCardView) {
        print("Flash card will flip")
    }
    
    
}
