//
//  FlashCard.swift
//  AC-iOS-Unit6HW
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import Firebase
struct FlashCard {
    let question: String
    let answer: String
    let category: String
    let userID: String
    init(question: String, answer: String, category: String, userID: String) {
        self.question = question
        self.answer = answer
        self.category = category
        self.userID = userID
    } 
    
}
