//
//  MockGarmentsInteractor.swift
//  GarmenttTests
//
//  Created by Sanith Gelli on 26/06/22.
//

import Foundation
@testable import Garmentt

class MockGarmentsInteractor: GarmentsInteracting {
    
    var garments: [GarmentViewModel] = []
    var loadGarmentsCallCount = 0
    
    func loadGarments() -> [GarmentViewModel] {
        loadGarmentsCallCount += 1
        return garments
    }
}
