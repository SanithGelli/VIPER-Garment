//
//  GarmentsDataHandling.swift
//  Garmentt
//
//  Created by Sanith Gelli on 26/06/22.
//

import Foundation
import CoreData

protocol GarmentsLoadDataHandling {
    func load() -> [GarmentViewModel]
}

protocol GarmentSaveDataHandling {
    func save(garment: GarmentViewModel) -> Bool
}

protocol GarmentEditDataHandling {
    func delete(garment: GarmentViewModel)
    func modify(garment: GarmentViewModel)
}

typealias GarmentsDataHandling = GarmentsLoadDataHandling & GarmentSaveDataHandling & GarmentEditDataHandling

class GarmentsDataHandler: GarmentsDataHandling {
    
    let dataManager: CoreDataManager
    
    init(dataManager: CoreDataManager = CoreDataManager.shared) {
        self.dataManager = dataManager
    }
    
    func save(garment: GarmentViewModel) -> Bool {
        let entity = Garment.entity()
        let garmentEntity = Garment(entity: entity,
                                    insertInto: self.dataManager.mainContext)
        garmentEntity.id = garment.id
        garmentEntity.name = garment.name
        garmentEntity.createdDate = garment.createdDate
        do {
            try self.dataManager.mainContext.save()
            return true
        } catch {
            debugPrint(error)
            return false
        }
    }
    
    func delete(garment: GarmentViewModel) {
        
    }
    
    func modify(garment: GarmentViewModel) {
        
    }
    
    func load() -> [GarmentViewModel] {
        let fetchRequest: NSFetchRequest<Garment> = Garment.fetchRequest()
        do {
            
            let results = try dataManager.mainContext.fetch(fetchRequest)
            return results.map{GarmentViewModel(garment: $0)}
        }
        catch {
            debugPrint(error)
            return []
        }
    }
}
