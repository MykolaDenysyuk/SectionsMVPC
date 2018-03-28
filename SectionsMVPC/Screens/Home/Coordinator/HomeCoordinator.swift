//
//  HomeCoordinator.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/28/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit


class HomeCoordinator: Coordinator {

    // MARK: Vars
    
    weak var rootController: UIViewController?
    
    func start(with data: Any?, from presentingController: UIViewController) {
        let controller = createViewController()
        self.rootController = controller
        presentingController.show(controller, sender: nil)
    }
    
    func start(in window: UIWindow) {
        let controller = createViewController()
        let container = UINavigationController(rootViewController: controller)
        self.rootController = controller
        window.rootViewController = container
    }
    
    private func createViewController() -> UIViewController {
        let presenter = HomePresenter(with: self)
        let controller = HomeViewController(datasource: presenter,
                                            eventsHandler: presenter)
        
        return controller
    }
}

extension HomeCoordinator: HomeCoordinatorInput {
    func showProfile() {
        guard let controller = rootController else { fatalError("root controller is required") }
        
        ProfileCoordinator().start(with: ProfileData(), from: controller)
    }
    
    func showSideMenu() {
        // todo
    }
}
