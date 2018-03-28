//
//  HomeItemCell.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/28/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit

class HomeItemCell: UICollectionViewCell {

    // MARK: Vars
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    // MARK: Actions
    
    func setup(with data: Home.Item) {
        icon.image = data.icon
        title.text = data.title
    }

}
