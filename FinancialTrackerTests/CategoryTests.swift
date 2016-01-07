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
    print(Category.Categories().count)
    assert(Category.Categories().count == 2)

    let categoryNames = ["abc", "123", "Undefined", "", "abc", "Income"]

    for categoryName in categoryNames {
      let category = Category(categoryName: categoryName)
      Category.addCategory(category)
    }
  }

  func testAddCategory() {
    setupCategories()
    assert(Category.Categories().count == 4)
  }

  func testRemoveCategory() {
    setupCategories()
    let removedCategory = Category(categoryName: "abc")

    for _ in (0...2) {
      Category.removeCategory(removedCategory)
      assert(Category.Categories().count == 3)

      let undefinedCategory = Category(categoryName: "Undefined")
      Category.removeCategory(undefinedCategory)
      assert(Category.Categories().count == 3)

      let incomeCategory = Category(categoryName: "Undefined")
      Category.removeCategory(incomeCategory)
      assert(Category.Categories().count == 3)
    }


  }

}
