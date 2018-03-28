//
//  ProfileCoordinatorInput.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/28/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit

protocol ProfileCoordinatorInput {
    /// close profile screen
    func close()
    
    /// Show edit profile screen
    func showEditProfile(complete: @escaping (ProfileData) -> Void)
    
    /// Show image picker
    func showProfileImagePicker(complete: @escaping (UIImage?) -> Void)
    
    /// Show Facebook login page
    func showFacebookLogin()
    
    /// Show Google login page
    func showGoogleLogin()
}

struct ProfileData {
    // todo
}
