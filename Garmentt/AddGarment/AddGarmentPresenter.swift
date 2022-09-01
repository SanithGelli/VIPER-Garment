//
//  AddGarmentPresenter.swift
//  Garmentt
//
//  Created by Sanith Gelli on 26/06/22.
//

import Foundation

class AddGarmentPresenter: AddGarmentPresenting {
    
    weak var view: AddGarmentDisplaying?
    
    var router: AddGarmentRouting?
    
    var interactor: AddGarmentInteracting?
    
    /// Check if name is nil and shows alert
    /// if name is valid, model object is sent to interactor to save to CD
    /// commands router to pop back if interactor saved data successfully, else shows alert that, save failed
    /// - Parameter name: name of Garment
    func addGarment(name: String?) {
        guard let text = name, text.count > 0 else {
            router?.showCancelAlert(with: AlertMessages.emptyName.rawValue)
            return
        }
        var garment = GarmentViewModel()
        garment.name = text
        let result = interactor?.addGarment(garment: garment)
        result == true ? router?.pop() : router?.showCancelAlert(with: AlertMessages.failedToSave.rawValue)
    }
    
    func viewDidLoad() {

    }
    
    func viewDidAppear() {
        
    }
    
    func viewWillDisappear() {
        view?.dismissKeyboard()
    }
}
