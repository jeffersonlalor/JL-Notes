//
//  JLGenericDAO.swift
//  JL-Notes
//
//  Created by Jefferson de Oliveira Lalor on 11/12/19.
//  Copyright © 2019 Lalor. All rights reserved.
//

import Foundation


public enum JLCoreDataError: Error {
    case invalidData(description: String)
    case internalError(description: String)
}

public protocol JLGenericDAO {
    associatedtype T
    
    func add(newEntity: T) throws
    func fetchAll() throws -> [T]
    func update(entity: T) throws
    func delete(entity: T) throws
}
