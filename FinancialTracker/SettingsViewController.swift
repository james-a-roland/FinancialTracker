//
//  SettingsViewController.swift
//  FinancialTracker
//
//  Created by James Roland on 12/21/15.
//  Copyright © 2015 James Roland. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

  static let cellReuseIdentifier = "SettingsViewControllerCell"

  @IBOutlet var categoryTable: UITableView!
  @IBOutlet var categoryField: UITextField!
  @IBOutlet var addCategoryButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

extension SettingsViewController {

  @IBAction func dismiss() {
    self.dismissViewControllerAnimated(true, completion: nil)
  }

  @IBAction func editTableView() {
    categoryTable.setEditing(!categoryTable.editing, animated: true)
    categoryField.enabled = !categoryField.enabled
    addCategoryButton.enabled = !addCategoryButton.enabled

  }

  @IBAction func addCategory() {
    if let name = categoryField.text {
      let newCategory = Category(categoryName: name)
      Category.addObject(newCategory)
      categoryTable.reloadData()
    }
  }

}

extension SettingsViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Category.allObjects().count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: 
    SettingsViewController.cellReuseIdentifier)

    if let category = (Category.allObjects("name"))[indexPath.row] as? Category {
      cell.textLabel?.text = category.name
    }

    return cell
  }

  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if (editingStyle == UITableViewCellEditingStyle.Delete) {
      if let category = (Category.allObjects("name"))[indexPath.row] as? Category {
        Category.removeObject(category)
        categoryTable.reloadData()
      }
    }
  }

}

extension SettingsViewController: UITableViewDelegate {

  func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//    if let category = Category.Categories().objectAtIndex(indexPath.row) as? Category
//      where category.name == Category.undefinedCategoryTitle || category.name == Category.incomeCategoryTitle {
//      return false
//    }
    return true
  }

}


