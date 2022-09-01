//
//  GarmentsRouter.swift
//  Garmentt
//
//  Created by Sanith Gelli on 26/06/22.
//

import Foundation
import UIKit

class GarmentsRouter: GarmentsRouting {
    
    weak var view: UIViewController?
    var addGarmentController: UIViewController?
    
    static func make() -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateInitialViewController() as? GarmentsViewController else {
            return UIViewController()
        }
        let router = GarmentsRouter()
        let presenter = GarmentsPresenter()
        let interactor = GarmentsInteractor()

        vc.presenter = presenter
        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor
        router.view = vc
        return vc
    }
    
    func showAddGarment(_ dismissed: @escaping (() -> Void)) {
        let garmentController = AddGarmentRouter.make { [weak self] in
            self?.addGarmentController = nil
            dismissed()
        }
        self.addGarmentController = garmentController
        guard let garmentController = self.addGarmentController else {
            return
        }
        view?.navigationController?.present(garmentController, animated: true)// pushViewController(garmentController, animated: true)
    }
}
