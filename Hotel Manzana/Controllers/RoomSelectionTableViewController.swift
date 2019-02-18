//
//  RoomSelectionTableViewController.swift
//  Hotel Manzana
//
//  Created by Гость on 16/02/2019.
//  Copyright © 2019 Гость. All rights reserved.
//

import UIKit

class RoomSelectionTableViewController: UITableViewController {
    
    var selectedRow: Int?
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RoomType.all.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        let room = RoomType.all[indexPath.row]
        cell.textLabel?.text = room.name
        cell.detailTextLabel?.text = "$\(room.price)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        if let selectedRow = selectedRow {
            if let selectedCell = tableView.cellForRow(at: IndexPath(row: selectedRow, section: 0)) {
                selectedCell.accessoryType = .none
            }
        }
        
        
        cell?.accessoryType = .checkmark
        
        selectedRow = indexPath.row
    }
    
}
