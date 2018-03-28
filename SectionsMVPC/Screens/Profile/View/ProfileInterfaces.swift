//
//  ProfileInterfaces.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/28/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit

/// Profile namespace
enum Profile {
    
    enum Item {
        case userImage(UserImage)
        case details(Details)
        case control(Control)
    }
    
    struct UserImage {
        let primaryImage: UIImage?
    }
    
    struct Details {
        let fullname: String
        let bio: String
    }
    
    struct Control {
        enum Style {
            case google, facebook
        }
        let style: Style
        let title: String
    }
    
    enum Event {
        case edit
    }
}
