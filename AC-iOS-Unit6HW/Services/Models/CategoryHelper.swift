//
//  CategoryHelper.swift
//  AC-iOS-Unit6HW
//
//  Created by C4Q on 2/20/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
class CateoryHelper {
    static let manager = CateoryHelper()
    private var allCategory: [String] = [ "Animals", "Art", "Beauty", "Books", "Business",
                                          "Education","Entertainment","News","Science",
                                          "Fashion", "Food","Health", "Other", "Math",
                                          "Sports","Tech","Travel","TV",]
    func getAllCategory() -> [String] {
        return allCategory.sorted()
    }
    func addToCategory(newItem: String) {
        if !allCategory.contains(newItem) {
        self.allCategory.append(newItem)
        }
    }
}
