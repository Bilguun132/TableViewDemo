//
//  UserView.swift
//  TableViewDemo
//
//  Created by Bilguun Batbold on 22/2/19.
//  Copyright © 2019 ISEM. All rights reserved.
//

import Foundation
import UIKit

class UserTableViewCell: UITableViewCell {
    
    //declare the outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    //setup the outlets however we want onces it's been init
    override func awakeFromNib() {
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        genderLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        emailLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
    }
    
    //add function to configure and set the texts
    func configure(user: User){
        nameLabel.text = user.name
        genderLabel.text = user.gender
        emailLabel.text = user.email
    }
}
