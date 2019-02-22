//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Bilguun Batbold on 22/2/19.
//  Copyright © 2019 ISEM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let refreshControl = UIRefreshControl()
    
    //declare an outlet and connect to the tableview previously created
    @IBOutlet weak var usersTableView: UITableView!
    
    private var userManager = UserManager()
    //initialize after self is available
    
    private lazy var userDataSourceProvider = UserDataSourceProvider(userManager: userManager)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the delegate and datasource to self
        
        usersTableView.register(UINib.init(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        usersTableView.delegate = userDataSourceProvider
        usersTableView.dataSource = userDataSourceProvider
        usersTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(getUsers), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching users ...", attributes: nil)
    }
    
    @objc func getUsers() {
        let user = User.init(name: "New from refresh control", gender: "new", email: "I am new")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.refreshControl.endRefreshing()
            self.userManager.addUser(user: user)
            self.usersTableView.reloadData()
        }
    }
}

