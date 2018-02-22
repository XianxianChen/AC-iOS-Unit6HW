//
//  FlashCardService.swift
//  AC-iOS-Unit6HW
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseDatabase

enum AppError: Error {
    case invalidChildren
}

class FlashCardService {
    static let manager = FlashCardService()
    private let rootRef: DatabaseReference!
    private let flashCardRef: DatabaseReference!
    private init() {
        rootRef = Database.database().reference()
        flashCardRef = Database.database().reference().child("falshCard")
    }
    func createFlashCard(question: String, answer: String, userID: String, category: String) {
     let card = FlashCard(question: question, answer: answer, category: category, userID: userID)
        flashCardRef.childByAutoId().setValue(card.toJson())
    }
    func getFlashCards(from category: String, completionHandler: @escaping ([FlashCard]?, Error?) -> Void) {
        flashCardRef.observe(.value) { (snapshot) in
            guard let childSnapShots = snapshot.children.allObjects as? [DataSnapshot] else {
                completionHandler(nil, AppError.invalidChildren)
                return
            }
            var cards = [FlashCard]()
            for childSnapshot in childSnapShots {
                guard let rawJson = childSnapshot.value else {continue}
                do {
                let jsonData = try JSONSerialization.data(withJSONObject: rawJson, options: [])
                let card = try JSONDecoder().decode(FlashCard.self, from: jsonData)
                    if card.category == category {
                    cards.append(card)
                    }
                } catch {
                    print(error)
                }
            }
              completionHandler(cards, nil)
            
        }
    }
    
}
