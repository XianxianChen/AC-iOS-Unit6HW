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
    override func viewDidLoad() {
        super.viewDidLoad()
       setupMainView()
     
    }

    func setupMainView() {
        view.backgroundColor = .orange
        view.addSubview(mainView)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(showCreateVC))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(signOut))
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
