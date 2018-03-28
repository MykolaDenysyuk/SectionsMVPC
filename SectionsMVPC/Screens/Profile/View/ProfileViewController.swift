//
//  ProfileViewController.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/28/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController {

    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBarControls()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: Actions
    
    func setupTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        tableView.registerReusableNib(ProfileImageCell.self)
        tableView.registerReusableNib(ProfileDetailsCell.self)
        tableView.registerReusableNib(ProfileControlCell.self)
    }
    
    func setupNavigationBarControls() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(closeAction))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editAction))
    }
    
    @objc func closeAction() {
        // todo
    }
    
    @objc func editAction() {
        // todo
    }
}
