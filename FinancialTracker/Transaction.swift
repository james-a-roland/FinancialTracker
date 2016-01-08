//
//  Transaction.swift
//  
//
//  Created by James Roland on 1/10/16.
//
//

import Foundation
import CoreData


class Transaction: CoreDataObject {

  override class func entityName() -> String {
    return "Transaction"
  }
}
