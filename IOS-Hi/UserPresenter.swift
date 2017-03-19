//
//  UserPresenter.swift
//  IOS-Hi
//
//  Created by iPibeDx on 5/03/17.
//  Copyright © 2017 PibeDx. All rights reserved.
//

import Foundation

class UserPresenter {
    
    fileprivate let userInteractor: UserInteractor
    weak fileprivate var userView: UserView?
    fileprivate let isUserCollectionEmpty = 0
    
    init(userInteractor: UserInteractor) {
        self.userInteractor = userInteractor
    }
    
    func attachView(_ userView: UserView) {
        self.userView = userView
    }
    
    func viewWillAppear() {
        loadUsers()
    }
    
    func loadUsers() {
        self.userView?.showLoading()
        userInteractor.getUsers{ [weak self] users in
        self?.userView?.hideLoading()
            if (users.count == self?.isUserCollectionEmpty) {
                self?.userView?.showEmptyCase()
            } else {
                self?.userView?.showUsers(users)
            }
        }
    }
    
    func detachView() {
        userView = nil
    }
    
}

protocol UserView: NSObjectProtocol {
    func showLoading()
    func hideLoading()
    func showEmptyCase()
    func showUsers(_ users: [User])
}
