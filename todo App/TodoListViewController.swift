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
 3. delete the viewcontroller from mainstory board and than add UITableViewController
 4. link the UITableViewController to todolistViewController class through identity inspector
 5. select prototype cell and through attribute inspector mention cell name (identifer name)
 6. than use tabelview datasource and delegates methods
 */

import UIKit

class TodoListViewController: UITableViewController {
    
    //creating array for saving hardcore data
    var itemArray = ["Shopping", "Cleaning", "Cooking"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK - TabelView Datasource Methods
    
    //Declare numberOfRowsInSection here:
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

     //Declare cellForRowAtIndexPath here:
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    
    //MARK - TabelView Delegate Methods
    //after selecting the row checkmark should add and if there is already a checkmark than uncheckmark it
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // to see after pressing particular row it should print that array index
        print(itemArray[indexPath.row])
        
        //to add checkmark we use below code
        //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        //after clicking that particular row show checkmark simultaneously turn gray  and again come back normal
        tableView.deselectRow(at: indexPath, animated: true)
        
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            	tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
       /* 1. for declaring textfield variable here and initize it for empty textfield. propose is that make it local variable which can be call within the clouser
          2. to access everywhere this variable not only inside the clouser, declare it outside the closure
 */
        var textField = UITextField()
        
        //add UIAlert function
        let alert = UIAlertController(title: "Add New Item in Todoey List", message: "", preferredStyle: .alert)
        //add action with UIAlert
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            print("Success!")
            //what gone be happened when user click hit add item on our UIAlert button
            
            self.itemArray.append(textField.text!)
            //if I dont use below code nothing going to add in tableview therefore it must be used this line of code to load the new item into the table
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
        alertTextField.placeholder = "Create new item"
            //print(alertTextField.text)
        textField = alertTextField
                
        }

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

