//
//  Notes.swift
//  JL-Notes
//
//  Created by Jefferson de Oliveira Lalor on 09/12/19.
//  Copyright © 2019 Lalor. All rights reserved.
//

import Foundation

public enum TypeNote {
    case newNote
    case existingNote
}

public struct JLNote {
    public var id: Int
    public var title: String
    public var date: Date
    public var text: String
    public var typeNote: TypeNote
}
