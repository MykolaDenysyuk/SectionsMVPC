//
//  ProfileControlCell.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/28/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit

class ProfileControlCell: UITableViewCell {

    @IBOutlet weak var controlTitleLabel: UILabel!
    
    func setup(with data: Profile.Control) {
        controlTitleLabel.text = data.title
        
        switch data.style {
        case .facebook:
            controlTitleLabel.backgroundColor = UIColor(red: 65/255, green: 93/255, blue: 174/255, alpha: 1)
        case .google:
            controlTitleLabel.backgroundColor = UIColor(red: 223/255, green: 74/255, blue: 50/255, alpha: 1)
        }
    }
    
}
