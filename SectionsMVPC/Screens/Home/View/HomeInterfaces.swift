//
//  HomeInterfaces.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/28/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit

/// Home module namespace
enum Home {
    
    /// Display item
    struct Item {
        let icon: UIImage?
        let title: String
    }
    
    /// Home screen custom events
    enum Event {
        case sideMenu
        case profile
    }
    
}
