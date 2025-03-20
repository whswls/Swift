//
//  FormTableViewController.swift
//  UIViewDemo
//
//  Created by 존진 on 3/13/25.
//

import UIKit

class FormTableViewController: UITableViewController {
    var flag = false
    let toggle = UISwitch()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorColor = .black
        
        setupUI()
    }
    
    func setupUI() {
        
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 1
        case 3:
            return 3
        default:
            return 2
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        //cell.backgroundColor = .systemGray
        // Configure the cell...
        var config = cell.defaultContentConfiguration()
        config.text = "Section: \(indexPath.section), Row: \(indexPath.row)"
        cell.contentConfiguration = config
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100
        case 1:
            return 200
        default:
            return 50
        }
    }
}

#Preview {
    FormTableViewController(style: .insetGrouped)
}
