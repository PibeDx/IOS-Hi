//
//  ViewController.swift
//  IOS-Hi
//
//  Created by iPibeDx on 5/03/17.
//  Copyright © 2017 PibeDx. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UserView {

    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var userTableView: UITableView!
    @IBOutlet weak var emptyCaseLabel: UILabel!
    
    fileprivate let presenter = UserPresenter(userInteractor: UserInteractor())
    fileprivate var users = [User]()
    fileprivate let userUITableViewDS = UserTableViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateTableView()
        configureActivityIndicatorView()
        presenter.attachView(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    func showLoading() {
        userTableView?.isHidden = true
        emptyCaseLabel?.isHidden = true
        activityIndicator?.startAnimating()
    }
    
    func hideLoading() {
        activityIndicator?.stopAnimating()
    }
    
    func showEmptyCase() {
        activityIndicator?.isHidden = true
        userTableView?.isHidden = true
        emptyCaseLabel?.isHidden = false
    }
    
    func showUsers(_ users: [User]) {
        self.users = users
        activityIndicator?.isHidden = true
        userTableView?.isHidden = false
        emptyCaseLabel?.isHidden = true
        userUITableViewDS.setUsers(self.users)
        userTableView?.reloadData()
    }
    
    fileprivate func configurateTableView() {
        userTableView?.dataSource = userUITableViewDS
    }
    
    fileprivate func configureActivityIndicatorView() {
        activityIndicator.hidesWhenStopped = true
    }

}

