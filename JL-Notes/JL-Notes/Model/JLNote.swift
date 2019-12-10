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

public var myNotes: [JLNote] = [
    JLNote.init(id: 0, title: "Oi - 01", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)", typeNote: .existingNote),
    JLNote.init(id: 1, title: "Oi - 02", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)", typeNote: .existingNote),
    JLNote.init(id: 2, title: "Oi - 03", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)", typeNote: .existingNote),
    JLNote.init(id: 3, title: "Oi - 04", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)", typeNote: .existingNote),
    JLNote.init(id: 4, title: "Oi - 05", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)", typeNote: .existingNote),
    JLNote.init(id: 5, title: "Oi - 06", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)", typeNote: .existingNote),
    JLNote.init(id: 6, title: "Oi - 07", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)", typeNote: .existingNote),
    JLNote.init(id: 7, title: "Oi - 08", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)", typeNote: .existingNote),
    JLNote.init(id: 8, title: "Oi - 09", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)", typeNote: .existingNote),
    JLNote.init(id: 9, title: "Oi - 10", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)", typeNote: .existingNote),
]
