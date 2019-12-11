//
//  NoteViewController.swift
//  JL-Notes
//
//  Created by Jefferson de Oliveira Lalor on 09/12/19.
//  Copyright © 2019 Lalor. All rights reserved.
//

import Foundation
import UIKit


public class JLNoteViewController: UIViewController {
    
    @IBOutlet weak var text: UITextView!
    
    public var note: JLNote! {
        didSet {
            DispatchQueue.main.async {
                self.navigationItem.title = self.note.title
            }
            
            guard self.note.typeNote == .existingNote else {return}
            
            #warning("update existent")
        }
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.fill()
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        self.note.text = self.text.text

        guard self.note.typeNote == .newNote else {return}
        
        self.note.typeNote = .existingNote
        JLDataManager.shared.add(newEntity: self.note)
    }
    
    
    @IBAction func editTitle(_ sender: Any) {
        self.showEditTitleAlert(title: "Edit Title", message: nil)
    }
    
    private func fill() {
        self.navigationItem.title = self.note.title
        self.text.text = self.note.text
    }
    
    private func showEditTitleAlert(title: String, message: String?) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .default, handler: nil)
        let okAction = UIAlertAction.init(title: "Ok", style: .default) { [unowned alert] _ in
            guard let textField = alert.textFields else {return}
            guard let newTitle = textField[0].text else {return}
            
            self.note.title = newTitle
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = self.note.title
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }

}
