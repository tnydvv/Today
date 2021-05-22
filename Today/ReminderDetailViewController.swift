//
//  ReminderDetailViewController.swift
//  Today
//
//  Created by Antonio Toriz on 08/05/2021.
//

import UIKit

class ReminderDetailViewController: UITableViewController {

    var reminder: Reminder?
    
    func configure(with reminder: Reminder) {
        self.reminder = reminder
    }
}
