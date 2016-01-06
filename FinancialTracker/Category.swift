//
//  Category.swift
//  FinancialTracker
//
//  Created by James Roland on 1/2/16.
//  Copyright © 2016 James Roland. All rights reserved.
//

import Foundation

class Category: NSObject, NSCoding {

  let name: String

  private static let defaults = NSUserDefaults.standardUserDefaults()
  private static let categoryUserDefaultsKey = "categories"
  private static let nameKey = "name"
  private static let undefinedCategoryTitle = "Undefined"


  init (categoryName: String?) {
    if let nm = categoryName {
      name = nm
    } else {
      name = ""
    }

    super.init()
  }

  @objc convenience required init?(coder aDecoder: NSCoder) {
    self.init(categoryName: aDecoder.decodeObjectForKey(Category.nameKey) as? String)
  }

  @objc func encodeWithCoder(aCoder: NSCoder) {
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
    let undefinedCategory = Category(categoryName: undefinedCategoryTitle)

    let data = NSKeyedArchiver.archivedDataWithRootObject(undefinedCategory)
    defaults.setObject(data, forKey: categoryUserDefaultsKey)
    defaults.synchronize()

    return NSArray(object: undefinedCategory)
  }

  static func removeCategory(category: Category) {
    if let categories = Categories().mutableCopy() as? NSMutableArray {
      categories.removeObject(category)

      let data = NSKeyedArchiver.archivedDataWithRootObject(categories)
      defaults.setObject(data, forKey: categoryUserDefaultsKey)
      defaults.synchronize()
    }
  }

  static func addCategory(category: Category) {
    if category.isUnique() && !category.name.isEmpty {
      if let categories = Categories().mutableCopy() as? NSMutableArray {
        categories.addObject(category)

        let data = NSKeyedArchiver.archivedDataWithRootObject(categories)
        defaults.setObject(data, forKey: categoryUserDefaultsKey)
        defaults.synchronize()
      }
    }
  }

  private static func saveToUserDefaults(object: AnyObject) {
    let data = NSKeyedArchiver.archivedDataWithRootObject(object)
    defaults.setObject(data, forKey: categoryUserDefaultsKey)
    defaults.synchronize()
  }

}
