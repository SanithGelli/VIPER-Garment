//
//  GarmentsPresenter.swift
//  Garmentt
//
//  Created by Sanith Gelli on 26/06/22.
//

import Foundation

class GarmentsPresenter: GarmentsPresenting {
    
    weak var view: GarmentsDisplaying?
    
    var router: GarmentsRouting?
    
    var interactor: GarmentsInteracting?
    
    private var garmentSortType: GarmentSorter = .alphabet
    
    private var garments: [GarmentViewModel] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.view?.reload()
            }
        }
    }
    
    func viewDidLoad() {
        view?.setUpNavUI()
    }
    
    func viewDidAppear() {
        loadData()
    }
    
    /// Commands router to push to AddGarmentController and upon pop back, loads the data
    func showAddGarment() {
        router?.showAddGarment({ [weak self] in
            self?.loadData()
        })
    }
    
    func numberOfRows() -> Int {
        garments.count
    }
    
    func titleForRow(at indexPath: IndexPath) -> String {
        garments[indexPath.row].name 
    }
    
    func didChangedSortType(sortType: GarmentSorter) {
        self.garmentSortType = sortType
        sortGarments(garments: garments)
    }
    
    private func loadData() {
        let garments = interactor?.loadGarments() ?? []
        sortGarments(garments: garments)
    }
    
    private func sortGarments(garments: [GarmentViewModel]) {
        self.garments = garments.sorted { first, second in
            switch garmentSortType {
            case .alphabet:
                return first.name.localizedCaseInsensitiveCompare(second.name) == ComparisonResult.orderedAscending
            case .createdDateTime:
                if let firstDate = first.createdDate, let secondDate = second.createdDate {
                    return firstDate > secondDate
                }
                return false
            }
        }
    }
}
