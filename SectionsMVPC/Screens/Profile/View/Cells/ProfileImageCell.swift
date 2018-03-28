//
//  ProfileImageCell.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/28/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit

class ProfileImageCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    
    func setup(with data: Profile.UserImage) {
        userImage.image = data.primaryImage
    }
    
}
