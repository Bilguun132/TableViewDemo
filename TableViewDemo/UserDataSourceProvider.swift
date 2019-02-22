//
//  UserDataSourceProvider.swift
//  TableViewDemo
//
//  Created by Bilguun Batbold on 22/2/19.
//  Copyright © 2019 ISEM. All rights reserved.
//

import Foundation
import UIKit

public class UserDataSourceProvider: NSObject, UITableViewDelegate, UITableViewDataSource {

    
    //private var to hold the user manager
    private let userManager: UserManager
    
    //initialize the user manager
    init(userManager: UserManager) {
        self.userManager = userManager
    }

    //tableview delegates declared here
    
    
    //set the height of header
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    //set the number of sections
    public func numberOfSections(in tableView: UITableView) -> Int {
        return userManager.userSections.count
    }
    //set the section index titles
    public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return userManager.userSections
    }
    //set the section header titles
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return userManager.userSections[section].uppercased()
    }
    //set the header view
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = #colorLiteral(red: 0.3333333333, green: 0.6392156863, blue: 0.9333333333, alpha: 1)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
        header.textLabel?.textColor = UIColor.white
    }
    //sets the nubmer of rows per section
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let userKey = userManager.userSections[section]
        if let users = userManager.userDictionaries[userKey] {
            return users.count
        }
        return 0
    }

    //populate the user from the dictionary instead of the array now
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UserTableViewCell
        let userKey = userManager.userSections[indexPath.section]
        if let users = userManager.userDictionaries[userKey.uppercased()] {
            cell.configure(user: users[indexPath.row])
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.userManager.deleteUser(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return [delete]
    }
    
}
