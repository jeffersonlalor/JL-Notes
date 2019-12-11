//
//  ViewController+TableView.swift
//  JL-Notes
//
//  Created by Jefferson de Oliveira Lalor on 09/12/19.
//  Copyright © 2019 Lalor. All rights reserved.
//

import Foundation
import UIKit


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as? JLTableViewCell else { return UITableViewCell.init() }
        
        cell.fill(note: self.notes[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            try? JLDataManager.shared.delete(entity: self.notes[indexPath.row])
            self.fetchNotes()
            self.tableView.reloadData()
        }
    }
        
}
