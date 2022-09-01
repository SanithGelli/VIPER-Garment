//
//  AddGarmentInteractor.swift
//  Garmentt
//
//  Created by Sanith Gelli on 26/06/22.
//

import Foundation

class AddGarmentInteractor: AddGarmentInteracting {
    
    private var dataHandler: GarmentSaveDataHandling
    
    init(dataHandler: GarmentSaveDataHandling = GarmentsDataHandler()) {
        self.dataHandler = dataHandler
    }
    
    func addGarment(garment: GarmentViewModel) -> Bool {
        return dataHandler.save(garment: garment)
    }
}
