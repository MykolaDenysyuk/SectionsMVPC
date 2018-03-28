//
//  HomeViewController.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/28/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import UIKit

class HomeViewController<Datasource, ViewOutput>: UICollectionViewController, CollectionViewContainer, SectionsViewInput, LoadingIndicatorContainer
where
    Datasource: SectionsDatasource, Datasource.Item == Home.Item,
    ViewOutput: SectionsViewOutput, ViewOutput.View == SectionsViewInput, ViewOutput.Event == Home.Event {
    
    // MARK: Vars
    
    let datasource: Datasource
    let eventsHandler: ViewOutput
    lazy var loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    // MARK: Initializer
    
    init(datasource: Datasource, eventsHandler: ViewOutput) {
        self.datasource = datasource
        self.eventsHandler = eventsHandler
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 128, height: 128)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 20
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .lightGray
        collectionView?.registerReusableNib(HomeItemCell.self)
        navigationItem.titleView = UIImageView(image: UIImage(named: "logo"))
        navigationItem.leftBarButtonItem =
            UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(menuAction))
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(image: UIImage(named: "profile"), style: .plain, target: self, action: #selector(profileAction))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        eventsHandler.viewDidFetchData(self)
    }
    
    // MARK: Actions
    
    @objc func menuAction() {
        eventsHandler.view(self, didProduceEvent: .sideMenu)
    }
    
    @objc func profileAction() {
        eventsHandler.view(self, didProduceEvent: .profile)
    }
    
    // MARK: Collection view
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return datasource.numberOfSections()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.numberOfItems(in: section)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeItemCell = collectionView.retrieveReusableItem(for: indexPath)
        let item = datasource.item(at: indexPath)
        cell.setup(with: item)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        eventsHandler.view(self, didSelectItemAt: indexPath)
    }

    // MARK: LoadingIndicatorContainer
    
    func animateLoadingIndicator(_ isAnimate: Bool) {
        loadingIndicator.animateLoadingIndicator(isAnimate)
        if isAnimate {
            view.addSubview(loadingIndicator)
        }
        else {
            loadingIndicator.removeFromSuperview()
        }
    }
}
