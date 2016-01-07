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
  static let undefinedCategoryTitle = "Undefined"
  static let incomeCategoryTitle = "Income"

  private static let defaults = NSUserDefaults.standardUserDefaults()
  private static let categoryUserDefaultsKey = "categories"
  private static let nameKey = "name"


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

    //Create two empty categories by default.
    let undefinedCategory = Category(categoryName: undefinedCategoryTitle)
    let incomeCategory = Category(categoryName: incomeCategoryTitle)
    let categories = NSMutableArray()
    categories.addObject(undefinedCategory)
    categories.addObject(incomeCategory)
    archiveUserDefaultsObject(categories)

    return categories as NSArray
  }

  static func removeCategory(category: Category) {
    if category.name == undefinedCategoryTitle || category.name == incomeCategoryTitle {
      return
    }

    if let categories = Categories().mutableCopy() as? NSMutableArray {
      for element in categories {
        if let cat = element as? Category where cat.name == category.name {
          categories.removeObject(cat)
          archiveUserDefaultsObject(categories)
        }
      }
    }
  }

  static func addCategory(category: Category) {
    if category.name == undefinedCategoryTitle || category.name == incomeCategoryTitle {
      return
    }

    if category.isUnique() && !category.name.isEmpty {
      if let categories = Categories().mutableCopy() as? NSMutableArray {
        categories.addObject(category)
        archiveUserDefaultsObject(categories)
      }
    }
  }

}

extension Category {
  private static func archiveUserDefaultsObject(object: AnyObject) {
    let data = NSKeyedArchiver.archivedDataWithRootObject(object)
    defaults.setObject(data, forKey: categoryUserDefaultsKey)
    defaults.synchronize()
  }

}
