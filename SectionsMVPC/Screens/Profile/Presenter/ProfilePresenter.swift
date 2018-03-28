//
//  ProfilePresenter.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/28/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import Foundation

class ProfilePresenter {
    
    // MARK: View lifecycle
    
    let coordinator: ProfileCoordinatorInput
    lazy var contentFactory = ContentFactory()
    var sections = [Section]()
    
    // MARK: Initializer
    
    init(with coordinator: ProfileCoordinatorInput) {
        self.coordinator = coordinator
    }
    
    // MARK: Actions
    
    func loadData(complete: @escaping () -> Void) {
        self.sections = contentFactory.create()
        complete()
    }
}

extension ProfilePresenter: SectionsViewOutput {
    typealias View = SectionsViewInput
    typealias Event = Profile.Event
    
    func viewDidFetchData(_ view: View) {
        view.showLoading(true)
        loadData {
            view.showLoading(false)
            view.reloadContent()
        }
    }
    
    func viewShouldClose(_ view: SectionsViewInput) {
        coordinator.close()
    }
    
    func view(_ view: SectionsViewInput, didSelectItemAt index: IndexPath) {
        let item = self.item(at: index)
        switch item {
        case .userImage:
            coordinator.showProfileImagePicker() { (newImage) in
                // todo: use new image
                view.reloadItems(at: [index])
            }
        case .details:
            break
        case .control(let control):
            switch control.style {
            case .facebook:
                coordinator.showFacebookLogin()
            case .google:
                coordinator.showGoogleLogin()
            }
        
        }
    }
    
    func view(_ view: SectionsViewInput, itemIndex: IndexPath?, didProduceEvent event: Event) {
        switch event {
        case .edit:
            coordinator.showEditProfile() { (newData) in
                // todo: use new data
                view.reloadContent()
            }
        }
    }
}

extension ProfilePresenter: SectionsDatasource {
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        return sections[section].items.count
    }
    
    func item(at index: IndexPath) -> Profile.Item {
        return sections[index.section].items[index.item]
    }
}
