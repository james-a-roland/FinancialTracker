//
//  Transaction.swift
//  FinancialTracker
//
//  Created by James Roland on 1/6/16.
//  Copyright © 2016 James Roland. All rights reserved.
//

import Foundation

class Transaction {

  let amount: NSNumber
  let category: Category
  let date: NSDate
  let name: String

  init(amount: NSNumber, category: Category, date: NSDate, name: String) {
    self.amount = amount
    self.category = category
    self.date = date
    self.name = name
  }

  
}
