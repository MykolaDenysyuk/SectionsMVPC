//
//  Coordinator.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/25/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit

/** Basic interface for coordinator.
    It describes all the methods available outside the module (for coordinator owner) */
protocol Coordinator {
    
    /// Generic type of the data to compose initial screen
    associatedtype InputData
    
    /// Intial controller of the module
    var rootController: UIViewController? { get }
    
    /// Module's entry point. Call this method to start the module
    ///
    /// - Parameters:
    ///   - data: with this data the initial screen is configured
    ///   - presentingController: the initial controller is shown from it
    func start(with data: InputData, from presentingController: UIViewController)
}
