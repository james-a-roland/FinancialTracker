//
//  Transaction+CoreDataProperties.swift
//  
//
//  Created by James Roland on 1/10/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Transaction {

    @NSManaged var name: String?
    @NSManaged var value: NSDecimalNumber?
    @NSManaged var date: NSDate?
    @NSManaged var category: Category?

}
