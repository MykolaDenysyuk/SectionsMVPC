//
//  HomePresenter.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/28/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import Foundation

class HomePresenter {
    
    // MARK: Vars
    
    let coordinator: HomeCoordinatorInput
    lazy var contentFactory = ContentFactory()
    var sections = [Section]()
    
    // MARK: Initializer
    
    init(with coordinator: HomeCoordinatorInput) {
        self.coordinator = coordinator
    }
    
    // MARK: Actions
    
    func loadData(complete: @escaping () -> Void) {
        self.sections = contentFactory.create()
        complete()
    }
}
extension HomePresenter: SectionsViewOutput {
    typealias View = SectionsViewInput
    typealias Event = Home.Event
    
    func viewDidFetchData(_ view: View) {
        view.showLoading(true)
        
        loadData {
            view.showLoading(false)
            view.reloadContent()
        }
    }
    
    func viewShouldClose(_ view: View) {
        // this particulare screen can't be closed
    }
    
    func view(_ view: View, didSelectItemAt index: IndexPath) {
        let message = "This functionality has not been implemented yet"
        coordinator.showAlert(message: message)
    }
    
    func view(_ view: SectionsViewInput, itemIndex: IndexPath?, didProduceEvent event: Event) {
        switch event {
        case .sideMenu:
            coordinator.showSideMenu()
        case .profile:
            coordinator.showProfile()
        }
    }
}

extension Home.Presenter: SectionsDatasource {
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        return sections[section].items.count
    }
    
    func item(at index: IndexPath) -> Home.Item {
        return sections[index.section].items[index.item]
    }
}
