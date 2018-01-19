//
//  AdditemTableViewController.swift
//  Bucket List
//
//  Created by keith Nguyen on 1/18/18.
//  Copyright © 2018 keith Nguyen. All rights reserved.
//

import UIKit

class AdditemTableViewController: UITableViewController {
    
    weak var delegate: AddItemTableViewControllerDelegate?
    var item: String?
    var indexPath: NSIndexPath?

    @IBOutlet weak var itemTextFielde: UITextField!
    
    @IBAction func savedButtonPressed(_ sender: UIBarButtonItem) {
        let text = itemTextFielde.text!
        delegate?.itemSaved(by: self, with:text, at: indexPath)
    }
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTextFielde.text = item
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
