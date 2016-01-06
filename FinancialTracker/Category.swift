//
//  Category.swift
//  FinancialTracker
//
//  Created by James Roland on 1/2/16.
//  Copyright © 2016 James Roland. All rights reserved.
//

import Foundation

class Category: NSCoding {

  let name: String

  private static let defaults = NSUserDefaults.standardUserDefaults()
  private static let categoryUserDefaultsKey = "categories"
  private static let nameKey = "name"

  init(categoryName: String) {
    name = categoryName
    super.init()
  }

  required convenience init?(coder aDecoder: NSCoder) {
    if let name = aDecoder.decodeObjectForKey(Category.nameKey) as? String {
      self.init(categoryName: name)
    }
    return nil
  }

  override func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(name, forKey: Category.nameKey)
  }

  func isUnique() -> Bool {
    for element in Category.Categories() {
      if let category = element as? Category {
        if category.name == name {
          return false
        }
      }
    }
    return true
  }

}

extension Category {

  static func Categories() -> NSArray {
    if let data = defaults.objectForKey(categoryUserDefaultsKey) as? NSData,
    categories = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? NSArray {
      return categories
    }

    //Create an empty category by default.
    let undefinedCategory = Category(categoryName: "Undefined")

    let data = NSKeyedArchiver.archivedDataWithRootObject(undefinedCategory)
    defaults.setObject(data, forKey: categoryUserDefaultsKey)
    defaults.synchronize()

    return NSArray(object: undefinedCategory)
  }

  static func removeCategory(category: Category) {
    let categories = Categories().mutableCopy()
    categories.removeObject(category)

    defaults.setObject(categories, forKey: categoryUserDefaultsKey)
    defaults.synchronize()
  }

  static func addCategory(category: Category) {
    if category.isUnique() {
      if let categories = Categories().mutableCopy() as? NSMutableArray {
        categories.addObject(category)

        let data = NSKeyedArchiver.archivedDataWithRootObject(categories)
        defaults.setObject(data, forKey: categoryUserDefaultsKey)
        defaults.synchronize()
      }
    }
  }

}
