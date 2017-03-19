//
//  UserTableViewDataSource.swift
//  IOS-Hi
//
//  Created by iPibeDx on 19/03/17.
//  Copyright © 2017 PibeDx. All rights reserved.
//

//Info: http://clean-swift.com/refactoring-table-view-data-source-and-delegate-methods/


import Foundation
import UIKit

class UserTableViewDataSource: NSObject, UITableViewDataSource {

    fileprivate var users = [User]()
    
    func setUsers(_ users: [User]) {
        self.users = users
    }
    
    override init() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "UserCell")
        let user = self.users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.lastName
        return cell
    }
}
