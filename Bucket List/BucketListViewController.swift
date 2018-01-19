//
//  ViewController.swift
//  Bucket List
//
//  Created by keith Nguyen on 1/17/18.
//  Copyright © 2018 keith Nguyen. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController, AddItemTableViewControllerDelegate{
    var items = ["Sky Diving", "Live in Hawaii", "Coding Dojo!"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddItemSegue"{
            let navigationController = segue.destination as! UINavigationController
            let AdditemTableViewController = navigationController.topViewController as! AdditemTableViewController
            AdditemTableViewController.delegate = self
        } else if segue.identifier == "EditItemSegue"{
            let navigationController = segue.destination as! UINavigationController
            let AdditemTableViewController = navigationController.topViewController as! AdditemTableViewController
            AdditemTableViewController.delegate = self
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            AdditemTableViewController.item = item
            AdditemTableViewController.indexPath = indexPath
        }
            
        }
   

    func cancelButtonPressed(by controller: AdditemTableViewController) {
        print ("i'm the hidden controller")
        dismiss(animated: true, completion: nil)
    }
    func itemSaved(by controller: AdditemTableViewController, with text: String, at indexPath: NSIndexPath?) {
        if let ip = indexPath{
            items[ip.row] = text
        } else {
            items.append(text)
           
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


