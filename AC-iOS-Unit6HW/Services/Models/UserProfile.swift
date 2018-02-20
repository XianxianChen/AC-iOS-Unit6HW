//
//  UserProfile.swift
//  AC-iOS-Unit6HW
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
struct UserProfile {
    let email: String
    let displayName: String
    let userID: String
    init(email: String, displayName: String, userID: String) {
        self.email = email
        self.displayName = displayName
        self.userID = userID
    }
}
