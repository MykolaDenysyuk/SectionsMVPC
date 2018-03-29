//
//  ProfileViewController.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/28/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit

class ProfileViewController<Datasource, ViewOutput>: UITableViewController, TableViewContainer, SectionsViewInput, LoadingIndicatorContainer
where
    Datasource: SectionsDatasource, Datasource.Item == Profile.Item,
    ViewOutput: SectionsViewOutput, ViewOutput.View == SectionsViewInput, ViewOutput.Event == Profile.Event {
    
    // MARK: Vars
    
    let datasource: Datasource
    let eventsHandler: ViewOutput
    
    
    // MARK: Initializer
    
    init(datasource: Datasource, eventsHandler: ViewOutput) {
        self.datasource = datasource
        self.eventsHandler = eventsHandler
        
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBarControls()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        eventsHandler.viewDidFetchData(self)
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
        eventsHandler.viewShouldClose(self)
    }
    
    @objc func editAction() {
        eventsHandler.view(self, didProduceEvent: .edit)
    }
    
    // MARK: Table view
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return datasource.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.numberOfItems(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = datasource.item(at: indexPath)
        
        switch item {
        case .userImage(let data):
            let cell: ProfileImageCell = tableView.retrieveReusableItem()
            cell.setup(with: data)
            return cell
        case .details(let data):
            let cell: ProfileDetailsCell = tableView.retrieveReusableItem()
            cell.setup(with: data)
            return cell
        case .control(let data):
            let cell: ProfileControlCell = tableView.retrieveReusableItem()
            cell.setup(with: data)
            return cell
        }
    }
    
    // MARK: LoadingIndicatorContainer
    
    func animateLoadingIndicator(_ isAnimate: Bool) {
        // todo
    }
}
