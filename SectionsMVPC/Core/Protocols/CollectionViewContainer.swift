//
//  CollectionViewContainer.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/25/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit

/** A simple interface to mark an object that has a collection view */
protocol CollectionViewContainer {
    var collectionView: UICollectionView { get }
}

extension CollectionViewContainer where Self: UICollectionViewController {
    var collectionView: UICollectionView {
        return self.collectionView!
    }
}
