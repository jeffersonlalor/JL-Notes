//
//  JLDataManager.swift
//  JL-Notes
//
//  Created by Jefferson de Oliveira Lalor on 11/12/19.
//  Copyright © 2019 Lalor. All rights reserved.
//

import Foundation
import CoreData


public struct JLDataManager: JLGenericDAO {
    public static let shared: JLDataManager = JLDataManager.init()
    private let viewContext = JLCoreDataManager.shared.viewContext
    private let entityName = "NoteMO"
    public typealias T = JLNote

    
    public func add(newEntity: JLNote) {
        let noteMO = NoteMO.init(context: self.viewContext)
        
        noteMO.id = Int16( newEntity.id )
        noteMO.date = newEntity.date
        noteMO.title = newEntity.title
        noteMO.text = newEntity.text
        
        JLCoreDataManager.shared.saveContext()
    }
    
    public func fetchAll() -> [JLNote] {
        guard let notesMO = self.fetchObjects(entityName: self.entityName) as? [NoteMO] else {
            JLCoreDataError.invalidData(description: "Error converting to [NSManagedObject]")
            return []
        }
        
        var notes: [JLNote] = []
        
        for note in notesMO {
            let newNote = JLNote.init(id: Int(note.id), title: note.title ?? "", date: note.date ?? Date.init(), text: note.text ?? "", typeNote: .existingNote)
            
            notes.append(newNote)
        }
        
        return notes
    }
    
    private func fetchObjects(entityName: String) -> [Any] {
        var fetchRequest: [Any] = []
        
        do {
            fetchRequest = try self.viewContext.fetch(NSFetchRequest<NSFetchRequestResult>(entityName: self.entityName))
        } catch {
            JLCoreDataError.internalError(description: error.localizedDescription)
        }
        
        return fetchRequest
    }
    
    public func update(entity: JLNote) {
        JLCoreDataError.internalError(description: "Not implemented")
    }
    
    public func delete(entity: JLNote) {
        JLCoreDataError.internalError(description: "Not implemented")
    }
    
}
