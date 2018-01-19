//
//  AdditemTableViewControllerDelegate.swift
//  Bucket List
//
//  Created by keith Nguyen on 1/18/18.
//  Copyright © 2018 keith Nguyen. All rights reserved.
//

import Foundation

protocol AddItemTableViewControllerDelegate: class {
    func itemSaved(by controller: AdditemTableViewController, with text:String, at indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: AdditemTableViewController)
}
