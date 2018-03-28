//
//  LoadingIndicatorContainer.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/25/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit

/** Object that conforms to this protocol can animate the indeterminate progress */
protocol LoadingIndicatorContainer {
    func animateLoadingIndicator(_ isAnimate: Bool)
}

extension UIActivityIndicatorView: LoadingIndicatorContainer {
    func animateLoadingIndicator(_ isAnimate: Bool) {
        if isAnimate {
            startAnimating()
        }
        else {
            stopAnimating()
        }
    }
}

