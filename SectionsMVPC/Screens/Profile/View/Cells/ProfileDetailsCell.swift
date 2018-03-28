//
//  ProfileDetailsCell.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/28/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit

class ProfileDetailsCell: UITableViewCell {

    // MARK: Vars
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    // MARK: Actions
    
    func setup(with data: Profile.Details) {
        nameLabel.text = data.fullname
        bioLabel.text = data.bio
    }
}
