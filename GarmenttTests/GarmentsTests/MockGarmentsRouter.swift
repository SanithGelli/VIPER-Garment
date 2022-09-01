//
//  MockGarmentsRouter.swift
//  GarmenttTests
//
//  Created by Sanith Gelli on 26/06/22.
//

import Foundation
@testable import Garmentt
import UIKit

class MockGarmentsRouter: GarmentsRouting {
    
    var view: UIViewController?
    var showAddGarmentCallCount = 0
    
    static func make() -> UIViewController {
        return UIViewController()
    }
    
    func showAddGarment(_ dismissed: @escaping (() -> Void)) {
        showAddGarmentCallCount += 1
    }
}
