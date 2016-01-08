//
//  CoreDataObject.swift
//  FinancialTracker
//
//  Created by James Roland on 1/10/16.
//  Copyright © 2016 James Roland. All rights reserved.
//

import Foundation
import CoreData

class CoreDataObject: NSManagedObject {

  // This method must be overridden.
  class func entityName() -> String {
    return ""
  }

  static func allObjects(sortingKey: String? = "sortingKey") -> [CoreDataObject] {
    do {
      let fetchRequest = NSFetchRequest(entityName: entityName())
      let sortDescriptor = NSSortDescriptor(key: sortingKey, ascending: true)
      fetchRequest.sortDescriptors = [sortDescriptor]

      if let objects = try CoreDataResource.sharedContext.executeFetchRequest(fetchRequest) as? [CoreDataObject] {
        return objects
      }
      return []
    } catch {
      print("Fetch request for allObjects failed")
    }
    return []
  }

  static func addObject(obj: CoreDataObject) {
    if let _ = NSEntityDescription.insertNewObjectForEntityForName(entityName(), inManagedObjectContext: CoreDataResource.sharedContext) as? CoreDataObject {
      do {
        try CoreDataResource.sharedContext.save()
      }
      catch {
        print("Insertion of new object \(obj) failed")
      }
    }
  }

  static func removeObject(obj: CoreDataObject) {
    CoreDataResource.sharedContext.deleteObject(obj)
    do {
      try CoreDataResource.sharedContext.save()
    }
    catch {
      print("Removal of object \(obj) failed")
    }

  }

}


