//
//  ProfileCoordinator.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/28/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    weak var rootController: UIViewController?
    
    func start(with data: ProfileData, from presentingController: UIViewController) {
        let presenter = ProfilePresenter(with: self)
        let controller = ProfileViewController(datasource: presenter, eventsHandler: presenter)
        guard let navigationController = presentingController.navigationController
            else {fatalError("navigation controller is required")}
        self.rootController = controller
        navigationController.pushViewController(controller, animated: true)
    }
}

extension ProfileCoordinator: ProfileCoordinatorInput {
    func close() {
        rootController?.navigationController?.popViewController(animated: true)
    }
    
    func showEditProfile(complete: @escaping (ProfileData) -> Void) {
        // todo
    }
    
    func showProfileImagePicker(complete: @escaping (UIImage?) -> Void) {
        // todo
    }
    
    func showFacebookLogin() {
        // todo
    }
    
    func showGoogleLogin() {
        // todo
    }
    
    
}
