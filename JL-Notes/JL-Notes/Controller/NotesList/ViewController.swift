//
//  ViewController.swift
//  JL-Notes
//
//  Created by Jefferson de Oliveira Lalor on 09/12/19.
//  Copyright © 2019 Lalor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    public let cellId = "JLTableViewCell"
    public var notes: [JLNote] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.fetchNotes()
            self.tableView.reloadData()
        }
    }
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func fetchNotes() {
        do {
            self.notes = try JLDataManager.shared.fetchAll()
        } catch {
            self.notes = []
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier != nil else {return}
        guard let noteViewController = segue.destination as? JLNoteViewController else {return}
        
        if segue.identifier == "newNote" {
            noteViewController.note = JLNote.init(id: self.notes.count, title: "New Note", date: Date.init(), text: "", typeNote: .newNote)
        } else if segue.identifier == "selectedCell" {
            guard let index = self.tableView.indexPathForSelectedRow else {return}
            noteViewController.note = self.notes[index.row]
        }
    }

}

