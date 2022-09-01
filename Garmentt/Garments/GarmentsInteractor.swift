//
//  GarmentsInteractor.swift
//  Garmentt
//
//  Created by Sanith Gelli on 26/06/22.
//

import Foundation

class GarmentsInteractor: GarmentsInteracting {
    
    private var dataHandler: GarmentsLoadDataHandling
    
    init(dataHandler: GarmentsLoadDataHandling = GarmentsDataHandler()) {
        self.dataHandler = dataHandler
    }
    
    func loadGarments() -> [GarmentViewModel] {
        dataHandler.load()
    }

}
