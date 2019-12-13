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
            try? JLDataManager.shared.update(entity: self.note)
        }
    }
    

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.fill()
        NotificationCenter.default.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        guard !self.text.text.isEmpty else {
            if self.note.typeNote == .existingNote {
                try? JLDataManager.shared.delete(entity: self.note)
            }
            
            return
        }
        self.note.text = self.text.text

        guard self.note.typeNote == .newNote else {return}
        
        self.note.typeNote = .existingNote
        try? JLDataManager.shared.add(newEntity: self.note)
    }
    
    
    @IBAction func editTitle(_ sender: Any) {
        self.showEditTitleAlert(title: NSLocalizedString("Edit Title", comment: "Editar Título"), message: nil)
    }
    
    private func fill() {
        self.navigationItem.title = self.note.title
        self.text.text = self.note.text
    }
    
    private func showEditTitleAlert(title: String, message: String?) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction.init(title: NSLocalizedString("Cancel", comment: "Cancelar"), style: .default, handler: nil)
        let okAction = UIAlertAction.init(title: "Ok", style: .default) { [unowned alert] _ in
            guard let textField = alert.textFields else {return}
            guard let newTitle = textField[0].text else {return}
            
            self.note.title = newTitle
        }
        
        alert.addTextField { (textField) in
            textField.autocorrectionType = .yes
            textField.clearButtonMode = .whileEditing
            textField.text = self.note.title
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        alert.view.layoutIfNeeded()
        
        present(alert, animated: true, completion: nil)
    }

    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            text.contentInset = .zero
        } else {
            text.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }

        text.scrollIndicatorInsets = text.contentInset

        let selectedRange = text.selectedRange
        text.scrollRangeToVisible(selectedRange)
    }
    
}
