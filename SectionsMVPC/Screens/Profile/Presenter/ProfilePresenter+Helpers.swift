//
//  ProfilePresenter+Helpers.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/28/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit

extension ProfilePresenter {
    
    struct Section {
        let items: [Profile.Item]
    }
    
    class ContentFactory {
        func create() -> [Section] {
            var items = [Profile.Item]()
            
            // user profile
            items.append(.userImage(.init(primaryImage: UIImage(named: "avatar"))))
            
            // details
            items.append(.details(.init(fullname: "Giuseppe Russo", bio: "Header Baker")))
            
            // facebook login
            items.append(.control(.init(style: .facebook, title: "Login with Facebook")))
            
            // google login
            items.append(.control(.init(style: .google, title: "Login with Google")))
            
            return [Section(items: items)]
        }
    }
    
}
