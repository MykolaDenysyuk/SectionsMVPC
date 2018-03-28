//
//  SectionsView.swift
//  SectionsMVPC
//
//  Created by Mykola Denysyuk on 3/25/18.
//  Copyright © 2018 Mykola Denysyuk. All rights reserved.
//

import Foundation

/** Generic datasource interface for list grouped by sections.
    Ususally, those attributes are enought to populate any table view
    or any other grouped items collection view */
protocol SectionsDatasource {
    associatedtype Item
    
    func numberOfSections() -> Int
    func title(for section: Int) -> String?
    func numberOfItems(in section: Int) -> Int
    func item(at index: IndexPath) -> Item
}

extension SectionsDatasource {
    /* default impl returns nil */
    func title(for section: Int) -> String? { return nil }
}

/** Generic interface for view that presents grouped list.
    This is the list of actions that can be done on it */
protocol SectionsViewInput: class {
    /** reload all rows */
    func reloadContent()
    /** reload specific items */
    func reloadItems(at indxs: [IndexPath])
    /** update title of specific section header */
    func reloadSectionTitle(section: Int)
    /** reload sections at the given indexes */
    func reloadSections(_ indxs: IndexSet)
    /** indicate loading state over whole view */
    func showLoading(_ isLoading: Bool)
    /** indicate loading state over specific row */
    func showLoading(_ isLoading: Bool, forRowAt index: IndexPath)
    /** scroll to a row at the given index, animated if needed */
    func scroll(to index: IndexPath, animated: Bool)
    /** asks view to insert new items at the given indexes */
    func insertRows(at indexPathes: [IndexPath])
    /** asks view to remove items at the given indexes */
    func removeRows(at indexPathes: [IndexPath])
}

// Optional methods - default impl do nothing.
// there is no need for all types the conform the protocol to stub this methods
extension SectionsViewInput {
    func reloadSectionTitle(section: Int) {}
    func scroll(to index: IndexPath, animated: Bool) {}
    func insertRows(at indexPathes: [IndexPath]) {}
    func removeRows(at indexPathes: [IndexPath]) {}
}

/** Provides the list of all basic events the view can produce,
    where the view be default is any type that conforms to SectionsViewInput.
    If you produce custom Event it should be wrapped into an object and passed into
    view(didProductEvent:) method. The best fit box for custom event is an enum with associated values.
    ALL EVENTS ARE TRIGGERED IN MAIN THREAD */
protocol SectionsViewOutput: class {
    associatedtype View = SectionsViewInput
    associatedtype Event
    
    /** it's called when view appears on screen and ready to show content
        (or whenever it require new data to show) */
    func viewDidFetchData(_ view: View)
    /** it's called when user hits the close/exit button */
    func viewShouldClose(_ view: View)
    /** it's called when used hits on an item at index from the presented list of grouped items */
    func view(_ view: View, didSelectItemAt index: IndexPath)
    /** it's called when view produces any custom event.
        itemIndex points to index of view item (cell) which triggered an event */
    func view(_ view: View, itemIndex: IndexPath?, didProduceEvent event: Event)
}

extension SectionsViewOutput {
    // optional method
    func view(_ view: View, didSelectItemAt index: IndexPath) {}
    func view(_ view: View, didProduceEvent event: Event) {
        self.view(view, itemIndex: nil, didProduceEvent: event)
    }
}

///
// Helpers
///

extension SectionsViewInput where Self: TableViewContainer {
    func reloadContent() {
        tableView.reloadData()
    }
    
    func reloadItems(at indxs: [IndexPath]) {
        tableView.reloadRows(at: indxs, with: .none)
    }
    
    func reloadSections(_ indxs: IndexSet) {
        tableView.reloadSections(indxs, with: .none)
    }
    
    func showLoading(_ isLoading: Bool, forRowAt index: IndexPath) {
        if let cell = tableView.cellForRow(at: index) as? LoadingIndicatorContainer {
            cell.animateLoadingIndicator(isLoading)
        }
    }
    
    func scroll(to index: IndexPath, animated: Bool) {
        tableView.scrollToRow(at: index, at: .middle, animated: animated)
    }
}

extension SectionsViewInput where Self: CollectionViewContainer {
    func reloadContent() {
        collectionView.reloadData()
    }
    
    func reloadItems(at indxs: [IndexPath]) {
        collectionView.reloadItems(at: indxs)
    }
    
    func reloadSections(_ indxs: IndexSet) {
        collectionView.reloadSections(indxs)
    }
    
    func showLoading(_ isLoading: Bool, forRowAt index: IndexPath) {
        if let cell = collectionView.cellForItem(at: index) as? LoadingIndicatorContainer {
            cell.animateLoadingIndicator(isLoading)
        }
    }
    
    func scroll(to index: IndexPath, animated: Bool) {
        collectionView.scrollToItem(at: index, at: .top, animated: animated)
    }
    
    func insertRows(at indexPathes: [IndexPath]) {
        collectionView.insertItems(at: indexPathes)
    }
    
    func removeRows(at indexPathes: [IndexPath]) {
        collectionView.deleteItems(at: indexPathes)
    }
    
}

extension SectionsViewInput where Self: LoadingIndicatorContainer {
    func showLoading(_ isLoading: Bool) {
        animateLoadingIndicator(isLoading)
    }
}
