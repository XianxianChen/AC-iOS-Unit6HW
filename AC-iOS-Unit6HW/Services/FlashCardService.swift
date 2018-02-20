//
//  FlashCardService.swift
//  AC-iOS-Unit6HW
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseDatabase
class FlashCardService {
    static let manager = FlashCardService()
    private let rootRef: DatabaseReference!
    private let flashCardRef: DatabaseReference!
    private init() {
        rootRef = Database.database().reference()
        flashCardRef = Database.database().reference().child("falshCard")
    }
    func createFlashCard(question: String, answer: String, userID: String, category: String) {
        let dict = ["question": question,
                    "answer": answer,
                    "userID": userID,
                    "category": category]
        flashCardRef.childByAutoId().setValue(dict)
    }
    
}
