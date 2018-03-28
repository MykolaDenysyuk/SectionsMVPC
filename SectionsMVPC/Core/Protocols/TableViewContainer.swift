//
//  TableViewContainer.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/25/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit

/** A simple interface to mark an object that has a table view */
protocol TableViewContainer {
    var tableView: UITableView { get }
}

extension TableViewContainer where Self: UITableViewController {
    var tableView: UITableView {
        return self.tableView!
    }
}
