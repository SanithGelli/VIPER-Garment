//
//  MockAddGarmentRouter.swift
//  GarmenttTests
//
//  Created by Sanith Gelli on 26/06/22.
//

import Foundation
@testable import Garmentt
import UIKit

class MockAddGarmentRouter: AddGarmentRouting {
    
    var popCallCount = 0
    var showCancelAlertCallCount = 0
    var view: UIViewController?
    var alertMessage: String = ""
    
    var dismissBlock: (() -> Void)?
    
    static func make(dismissBlock: (() -> Void)?) -> UIViewController {
        return UIViewController()
    }
    
    func pop() {
        popCallCount += 1
    }
    
    func showCancelAlert(with message: String) {
        alertMessage = message
        showCancelAlertCallCount += 1
    }
}
