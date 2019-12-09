//
//  NoteViewController.swift
//  JL-Notes
//
//  Created by Jefferson de Oliveira Lalor on 09/12/19.
//  Copyright © 2019 Lalor. All rights reserved.
//

import Foundation
import UIKit


public class NoteViewController: UIViewController {
    
    @IBOutlet weak var text: UITextView!
    
    public var note: JLNote!

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.fill()
    }
    
    private func fill() {
        self.navigationItem.title = self.note.title
        self.text.text = self.note.text
    }
    
}
