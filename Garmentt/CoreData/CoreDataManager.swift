//
//  CoreDataHandler.swift
//  Garmentt
//
//  Created by Sanith Gelli on 26/06/22.
//

import Foundation
import CoreData

protocol CoreDataManaging {
    
}

class CoreDataManager {
    
    static let shared: CoreDataManager = CoreDataManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Garmentt")
        container.loadPersistentStores { storeDescription, error in
            // print error
        }
        return container
    }()
    
    internal var mainContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveContext () {
        let context = mainContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
