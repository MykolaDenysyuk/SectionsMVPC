//
//  AppCoordinator.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/28/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit


class AppCoordinator {
    
    func start(in window: UIWindow) {
        HomeCoordinator().start(in: window)
        window.makeKeyAndVisible()
    }
    
}
