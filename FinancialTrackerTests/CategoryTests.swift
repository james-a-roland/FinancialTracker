//
//  CategoryTests.swift
//  FinancialTracker
//
//  Created by James Roland on 1/6/16.
//  Copyright © 2016 James Roland. All rights reserved.
//

import XCTest

class CategoryTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
    NSUserDefaults.resetStandardDefaults()
  }

  func setupCategories() {
    NSUserDefaults.resetStandardDefaults()
    assert(Category.Categories().count == 1)

    let categoryNames = ["abc", "123", "Undefined", "", "abc"]

    for categoryName in categoryNames {
      let category = Category(categoryName: categoryName)
      Category.addCategory(category)
    }
  }

  func testAddCategory() {
    setupCategories()
    assert(Category.Categories().count == 3)
  }

  func testRemoveCategory() {
    setupCategories()
    let removedCategory = Category(categoryName: "abc")

    for _ in (0...2) {
      Category.removeCategory(removedCategory)
      assert(Category.Categories().count == 2)

      let permanentCategory = Category(categoryName: "Undefined")
      Category.removeCategory(permanentCategory)
      assert(Category.Categories().count == 2)
    }


  }

}
