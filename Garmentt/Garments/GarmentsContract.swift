//
//  GarmentsContract.swift
//  Garmentt
//
//  Created by Sanith Gelli on 26/06/22.
//

import Foundation
import UIKit

protocol GarmentsRouting {
    var view: UIViewController? { get set }
    static func make() -> UIViewController
    func showAddGarment(_ dismissed: @escaping (() -> Void))
}

protocol GarmentsDisplaying: AnyObject {
    var presenter: GarmentsPresenting? { get set }
    func setUpNavUI()
    func reload()
}

protocol GarmentsInteracting {
    func loadGarments() -> [GarmentViewModel]
}

protocol GarmentsPresenting: AnyObject {
    var view: GarmentsDisplaying? { get set }
    var router: GarmentsRouting? { get set }
    var interactor: GarmentsInteracting? { get set }
    
    func viewDidLoad()
    func viewDidAppear()
    func showAddGarment()
    func numberOfRows() -> Int
    func titleForRow(at indexPath: IndexPath) -> String
    func didChangedSortType(sortType: GarmentSorter)
}
