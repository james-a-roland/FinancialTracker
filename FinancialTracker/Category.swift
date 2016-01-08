//
//  Category.swift
//  
//
//  Created by James Roland on 1/10/16.
//
//

import Foundation
import CoreData

class Category: CoreDataObject {

  convenience init (categoryName: String) {
    self.init()
    self.name = categoryName
  }

  override class func entityName() -> String {
    return "Category"
  }
}
