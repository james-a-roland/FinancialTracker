//
//  NSUserDefaultsExtension.swift
//  FinancialTracker
//
//  Created by James Roland on 1/3/16.
//  Copyright © 2016 James Roland. All rights reserved.
//

import Foundation

extension NSUserDefaults {

  static func resetStandardDefaults() {
    let defaults = NSUserDefaults.standardUserDefaults()
    let defaultsDictionary = defaults.dictionaryRepresentation()
    for (key, _) in defaultsDictionary {
      defaults.removeObjectForKey(key)
    }
    defaults.synchronize()
  }
}