//
//  UserInteractor.swift
//  IOS-Hi
//
//  Created by iPibeDx on 5/03/17.
//  Copyright © 2017 PibeDx. All rights reserved.
//

import Foundation

class UserInteractor {
    fileprivate let users: [User]
    
    init() {
        self.users =
            [
                User(name:"Juan", lastName: "Perez", age:18),
                User(name:"José", lastName: "Cuentas", age:23)
            ]
    }
    
    func getUsers(_ callBack: @escaping ([User]) -> Void){
        delay(1.5) {
            callBack(self.users)
        }
    }
    
    fileprivate func delay(_ delay: Double, closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure
        )
    }
}
