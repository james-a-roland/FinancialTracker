//
//  TabViewController.swift
//  FinancialTracker
//
//  Created by James Roland on 12/21/15.
//  Copyright © 2015 James Roland. All rights reserved.
//

import Foundation
import UIKit

class TabViewController : UIViewController {
  func presentSettingsViewController() {
    let svc = SettingsViewController()
    self.navigationController?.presentViewController(svc, animated: true, completion: nil)
  }
  
  func addNewTransaction() {
    print("Add new transaction")
  }
}
