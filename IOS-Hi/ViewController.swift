//
//  ViewController.swift
//  IOS-Hi
//
//  Created by iPibeDx on 5/03/17.
//  Copyright © 2017 PibeDx. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UserView, UITableViewDataSource {

    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var userTableView: UITableView!
    @IBOutlet weak var emptyCaseLabel: UILabel!
    
    fileprivate let presenter = UserPresenter(userInteractor: UserInteractor())
    fileprivate var users = [User]()
    
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
        userTableView?.reloadData()
    }
    
    fileprivate func configurateTableView() {
        userTableView?.dataSource = self
    }
    
    fileprivate func configureActivityIndicatorView() {
        activityIndicator.hidesWhenStopped = true
    }

}

