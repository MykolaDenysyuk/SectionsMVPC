//
//  HomeCoordinatorInput.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/28/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import Foundation

/// This is communitation interface between the Presenter and Coordinator
protocol HomeCoordinatorInput: class, AlertsCoordinator {
    
    /// Show profile screen
    func showProfile()
    
    /// Show side menu
    func showSideMenu()
}
