//
//  CoreDataResource.swift
//  FinancialTracker
//
//  Created by James Roland on 1/10/16.
//  Copyright © 2016 James Roland. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataResource {
  static let sharedContext : NSManagedObjectContext = {
    let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
    return delegate.managedObjectContext!
  }()
}