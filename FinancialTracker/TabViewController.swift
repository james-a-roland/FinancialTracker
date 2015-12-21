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
  @IBAction func presentSettingsViewController (sender: UIButton) {
    print("Settings view controller")
  }
  @IBAction func addNewTransaction (sender: UIButton) {
    print("Add new transaction")
  }
}
