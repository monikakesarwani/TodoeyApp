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
    
    /*
     ***** how to use use a default to persist data
     1. So in order to persist data. we have to use a default. for creating a new object as a defaults
    we'll set it to equal user defaults which is an interface to the user's default   database where you stole a key value pairs persistently across launches of your app.
     2. Than we can save the updated item into array.
     self.defaults.set(self.itemArray, forKey: "ItemTodoList")
     it saved data into form of Dictionary value (any item in itemArray) Key ("ItemTodoList")
     3. in order to retrieve our data is we can go into view did load and we can set  itemArray = defaults.array(forKey: "ItemTodoList") as! [String]
    */
    let defaults = UserDefaults.standard
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let item = defaults.array(forKey: "ItemTodoList") as? [String]{
            itemArray = item
        }
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
            
            // you append any item in array and if app any resone is terminated and added item not going to save in array for that you have to use this this code and call it in viewDidLoad
            self.defaults.set(self.itemArray, forKey: "ItemTodoList")
            
            
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

