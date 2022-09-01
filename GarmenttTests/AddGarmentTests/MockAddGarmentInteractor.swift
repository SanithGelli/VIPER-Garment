//
//  MockAddGarmentInteractor.swift
//  GarmenttTests
//
//  Created by Sanith Gelli on 26/06/22.
//

import Foundation
@testable import Garmentt

class MockAddGarmentInteractor: AddGarmentInteracting {
    
    var addGarmentCallCount = 0
    var addGarmentResult = true
    
    func addGarment(garment: GarmentViewModel) -> Bool {
        addGarmentCallCount += 1
        return addGarmentResult
    }
}
