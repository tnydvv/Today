//
//  ViewController.swift
//  Today
//
//  Created by Antonio Toriz on 07/05/2021.
//

import UIKit

class ReminderListViewController: UITableViewController {
    
    private var reminderListDataSource: ReminderListDataSource?
    
    static let showDetailSegueIdentifier = "ShowReminderDetailSegue"
    
    // This method notifies the view controller before a segue is performed.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Self.showDetailSegueIdentifier,
           let destination = segue.destination as? ReminderDetailViewController,
           let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            let rowIndex = indexPath.row
            guard let reminder = reminderListDataSource?.reminder(at: rowIndex) else {
                fatalError("Couldn't find data source for reminder list.")
            }
            destination.configure(with: reminder) { reminder in
                self.reminderListDataSource?.update(reminder, at: rowIndex)
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reminderListDataSource = ReminderListDataSource()
        tableView.dataSource = reminderListDataSource
    }
}
