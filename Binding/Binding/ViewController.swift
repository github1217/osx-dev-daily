//
//  ViewController.swift
//  Binding
//
//  Created by Harry Ng on 6/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    dynamic var users: [User] = []
    var currentUser: User?
    
    @IBOutlet weak var tableView: NSTableView!

    @IBOutlet weak var firstNameField: NSTextField!
    @IBOutlet weak var lastNameField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func updateUser(sender: NSButton) {
//        currentUser?.firstName = firstNameField.stringValue
//        currentUser?.lastName = lastNameField.stringValue
    }

}

extension ViewController: NSTableViewDelegate {
    func tableViewSelectionDidChange(notification: NSNotification) {
        print(tableView.selectedRow)
        let user = users[tableView.selectedRow]
        currentUser = user
        
        firstNameField.stringValue = user.firstName
        lastNameField.stringValue = user.lastName
    }
}

extension ViewController: NSTextFieldDelegate {
    
    override func controlTextDidChange(obj: NSNotification) {
        currentUser?.firstName = firstNameField.stringValue
        currentUser?.lastName = lastNameField.stringValue
    }
    
}
