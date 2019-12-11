//
//  JLDataController.swift
//  JL-Notes
//
//  Created by Jefferson de Oliveira Lalor on 11/12/19.
//  Copyright © 2019 Lalor. All rights reserved.
//

import Foundation
import CoreData


public struct JLCoreDataManager {
    public static let shared: JLCoreDataManager = JLCoreDataManager.init(modelName: "JL-Notes")
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    init(modelName: String) {
        self.persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    public func load() {
        self.persistentContainer.loadPersistentStores { (storeDescription, error) in
            guard let erro = error else {return}
            JLCoreDataError.internalError(description: erro.localizedDescription)
        }
    }
    
    public func saveContext () {
        if self.viewContext.hasChanges {
            do {
                try self.viewContext.save()
            } catch {
                JLCoreDataError.internalError(description: error.localizedDescription)
            }
        }
    }


}
