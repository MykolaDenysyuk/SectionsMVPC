//
//  AlertsCoordinator.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/25/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit

/** Entry point into alerts module. It has all required methods to build and show an alert */
protocol AlertsCoordinator {
    /** show simple alert with a message */
    func showAlert(message: String)
}

extension AlertsCoordinator where Self: Coordinator {
    func showAlert(message: String) {
        guard let rootController = self.rootController else { return }
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        rootController.present(alert, animated: true, completion: nil)
    }
}
