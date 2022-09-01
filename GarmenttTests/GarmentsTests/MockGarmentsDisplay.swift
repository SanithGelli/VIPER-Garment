//
//  MockGarmentsDisplay.swift
//  GarmenttTests
//
//  Created by Sanith Gelli on 26/06/22.
//

import Foundation
@testable import Garmentt

class MockGarmentsDisplay: GarmentsDisplaying {
    
    var setUpNavUICallCount = 0
    var reloadCallCount = 0
    
    var presenter: GarmentsPresenting?
    
    func setUpNavUI() {
        setUpNavUICallCount += 1
    }
    
    func reload() {
        reloadCallCount += 1
    }
}
