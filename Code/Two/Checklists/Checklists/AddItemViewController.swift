//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Liuguiliang on 2017/8/10.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController  {
    
    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done() {
        dismiss(animated: true, completion: nil)
    }
    
   override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
