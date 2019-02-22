//
//  User.swift
//  TableViewDemo
//
//  Created by Bilguun Batbold on 22/2/19.
//  Copyright © 2019 ISEM. All rights reserved.
//

import Foundation

public struct User {
    let name: String
    let gender: String
    let email: String
}

public class UserManager {
    
    //set array of users (in reality this is usually from a network call
    public var users: [User] = [User(name: "Albert", gender: "Male", email: "albert@gmail.com"), User(name: "Bob", gender: "Male", email: "bob@gmail.com"), User(name: "Celine", gender: "Female", email: "celine@gmail.com"), User(name: "Derrick", gender: "Male", email: "derrick@gmail.com"), User(name: "Aldwin", gender: "Male", email: "aldwin@gmail.com")]
    
    private var userSection = [String]()
    private var userDictionary = [String:[User]]()
    
    //invoke sort user function when initialized
    init() {
        sortUser()
    }
    
    //this functions goes through each user and sets the first letter as a key. It then populates the list of users with the same key
    // this way we will end up with dictionary of users under their respecive alphabetical order
    private func sortUser() {
        for user in users {
            let key = "\(user.name[user.name.startIndex])".uppercased()
            if let _ = self.userDictionary[key] {
                self.userDictionary[key]?.append(user)
            } else {
                self.userDictionary[key] = [user]
            }
            self.userSection = [String](self.userDictionary.keys).sorted()
        }
    }
    
    public var userSections: [String] {
        return userSection
    }
    
    public var userDictionaries: [String:[User]] {
        return userDictionary
    }
    
    //return total count
    public var userCount: Int {
        return users.count
    }
    
    public func addUser(user: User) {
        users.append(user)
        self.userDictionary.removeAll()
        sortUser()
    }
    
    //get user
    public func getUser(at index:Int) -> User {
        return users[index]
    }
    
    public func deleteUser(at index: Int) {
        users.remove(at: index)
    }
}
