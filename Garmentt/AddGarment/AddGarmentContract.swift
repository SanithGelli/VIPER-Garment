//
//  AddGarmentContract.swift
//  Garmentt
//
//  Created by Sanith Gelli on 26/06/22.
//

import Foundation
import UIKit

protocol AddGarmentRouting {
    var view: UIViewController? { get set }
    var dismissBlock: (() -> Void)? { get set }
    
    static func make(dismissBlock: (() -> Void)?) -> UIViewController
    func pop()
    func showCancelAlert(with message: String)
}

protocol AddGarmentPresenting {
    
    var view: AddGarmentDisplaying? { get set }
    var router: AddGarmentRouting? { get set }
    var interactor: AddGarmentInteracting? { get set }

    
    func addGarment(name: String?)
    func viewDidLoad()
    func viewDidAppear()
    func viewWillDisappear()
}

protocol AddGarmentDisplaying: AnyObject {
    var presenter: AddGarmentPresenting? { get set }
    func dismissKeyboard()
}

protocol AddGarmentInteracting {
    func addGarment(garment: GarmentViewModel) -> Bool
}
