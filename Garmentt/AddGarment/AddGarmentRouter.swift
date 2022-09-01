//
//  AddGarmentRouter.swift
//  Garmentt
//
//  Created by Sanith Gelli on 26/06/22.
//

import Foundation
import UIKit

class AddGarmentRouter: AddGarmentRouting {
    
    weak var view: UIViewController?
    var dismissBlock: (() -> Void)?
    
    static func make(dismissBlock: (() -> Void)?) -> UIViewController {
        let storyBoard = UIStoryboard(name: "AddGarment", bundle: nil)
        guard let vc = storyBoard.instantiateInitialViewController() as? AddGarmentViewController else {
            return UIViewController()
        }
        let router = AddGarmentRouter()
        let presenter = AddGarmentPresenter()
        let interactor = AddGarmentInteractor()

        vc.presenter = presenter
        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor
        router.view = vc
        router.dismissBlock = dismissBlock
        return vc
    }
    
    func pop() {
        DispatchQueue.main.async { [weak self] in
            self?.view?.dismiss(animated: true)
            self?.dismissBlock?()
        }
    }
    
    func showCancelAlert(with message: String) {
        DispatchQueue.main.async { [weak self] in
            let controller = UIAlertController(title: "Garmentt", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .cancel)
            controller.addAction(action)
            self?.view?.present(controller, animated: true)
        }
    }
}
