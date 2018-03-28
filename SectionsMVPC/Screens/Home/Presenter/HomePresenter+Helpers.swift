//
//  HomePresenter+Helpers.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/28/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit

extension HomePresenter {
    
    /// Simple items container
    struct Section {
        let items: [Home.Item]
    }
    
    /// Creates display items for Presenter
    class ContentFactory {
        func create() -> [Section] {
            return [Section(items: [Home.Item(icon: UIImage(named: "bread"), title: "Lorem"),
                                    Home.Item(icon: UIImage(named: "donut"), title: "Ipsum"),
                                    Home.Item(icon: UIImage(named: "loaf"), title: "Dolor")])]
        }
    }
    
}
