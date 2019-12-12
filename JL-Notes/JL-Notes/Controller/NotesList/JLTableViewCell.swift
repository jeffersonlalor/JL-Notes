//
//  JLTableViewCell.swift
//  JL-Notes
//
//  Created by Jefferson de Oliveira Lalor on 09/12/19.
//  Copyright © 2019 Lalor. All rights reserved.
//

import Foundation
import UIKit


public class JLTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    
    
    public func fill(note: JLNote) {
        let dateFormat = DateFormatter.init()
        dateFormat.dateFormat = "dd MMMM, HH:mm"
        
        self.title.text = note.title
        self.date.text = dateFormat.string(from: note.date)
    }
}
