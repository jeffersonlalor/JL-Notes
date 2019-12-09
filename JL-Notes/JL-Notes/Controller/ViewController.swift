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
    
    public var myNotes: [JLNote] = [
        JLNote.init(title: "Oi - 01", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)"),
        JLNote.init(title: "Oi - 02", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)"),
        JLNote.init(title: "Oi - 03", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)"),
        JLNote.init(title: "Oi - 04", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)"),
        JLNote.init(title: "Oi - 05", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)"),
        JLNote.init(title: "Oi - 06", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)"),
        JLNote.init(title: "Oi - 07", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)"),
        JLNote.init(title: "Oi - 08", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)"),
        JLNote.init(title: "Oi - 09", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)"),
        JLNote.init(title: "Oi - 10", date: Date.init(), text: "Esse é um texto de teste para popular essa tableView! :)"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

}

