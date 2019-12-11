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

    
    public func add(newEntity: JLNote) throws {
        let noteMO = NoteMO.init(context: self.viewContext)
        
        noteMO.id = newEntity.id
        noteMO.date = newEntity.date
        noteMO.title = newEntity.title
        noteMO.text = newEntity.text
        
        do {
            try JLCoreDataManager.shared.saveContext()
        } catch {
            throw JLCoreDataError.internalError(description: "New note dont saved")
        }
    }
    
    public func fetchAll() throws -> [JLNote] {
        guard let notesMO = try self.fetchObjects(entityName: self.entityName, predicate: nil) as? [NoteMO] else {
            throw JLCoreDataError.invalidData(description: "Error converting to [NSManagedObject]")
        }
        
        var notes: [JLNote] = []
        
        for note in notesMO {
            let newNote = JLNote.init(id: note.id ?? UUID.init(), title: note.title ?? "", date: note.date ?? Date.init(), text: note.text ?? "", typeNote: .existingNote)
            
            notes.append(newNote)
        }
        
        return notes
    }
    
    private func fetchObjects(entityName: String, predicate: NSPredicate?) throws -> [Any] {
        var result: [Any] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: self.entityName)
        fetchRequest.predicate = predicate

        do {
            result = try self.viewContext.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
            throw JLCoreDataError.internalError(description: error.localizedDescription)
        }
        
        return result
    }
    
    public func update(entity: JLNote) throws {
        let predicate = NSPredicate.init(format: "id = %@", "\(entity.id)")
        guard let notesMO = try self.fetchObjects(entityName: self.entityName, predicate: predicate) as? [NoteMO] else {return}
        
        guard notesMO.count == 1 else {return}
        
        notesMO[0].title = entity.title
        notesMO[0].text = entity.text
        
        do{
            try JLCoreDataManager.shared.saveContext()
        } catch {
            throw JLCoreDataError.internalError(description: "Update don't saved")
        }
    }
    
    public func delete(entity: JLNote) throws {
        let predicate = NSPredicate.init(format: "id = %@", "\(entity.id)")
        guard let notesMO = try self.fetchObjects(entityName: self.entityName, predicate: predicate) as? [NoteMO] else {return}
        
        guard notesMO.count == 1 else {return}

        self.viewContext.delete(notesMO[0])
        
        do{
            try JLCoreDataManager.shared.saveContext()
        } catch {
            throw JLCoreDataError.internalError(description: "Delete don't saved")
        }
    }
    
}
