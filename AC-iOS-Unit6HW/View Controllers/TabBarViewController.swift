//
//  TabBarViewController.swift
//  AC-iOS-Unit6HW
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    let mainVC = MainViewController()
    let createFlashCardVC = CreateFlashCardViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainVC.tabBarItem = UITabBarItem(title: "Cards", image: nil, tag: 0)
   
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
