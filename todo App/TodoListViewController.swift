//
//  ViewController.swift
//  todo App
//
//  Created by Anil on 10/10/19.
//  Copyright © 2019 kesarwani. All rights reserved.
//

/*
 1. conform the UITableViewController protocol
 2. rename ViewController accordingly
 3.delete the viewcontroller from mainstory board and than add UITableViewController
 4. link the UITableViewController to todolistViewController class through identity inspector
 5.select prototype cell and through attribute inspector mention cell name (identifer name)
 6. than use tabelview datasource and delegates methods
 */

import UIKit

class TodoListViewController: UITableViewController {
    
    //creating array for hardcore data
    var itemArray = ["Shopping", "Cleaning", "Cooking"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK - TabelView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

     
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK - TabelView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        tableView.deselectRow(at: indexPath, animated: true)
        
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            	tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    
    
    
    
}

