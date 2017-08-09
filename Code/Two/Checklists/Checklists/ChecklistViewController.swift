//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Liuguiliang on 2017/8/8.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var row0checked = false;
    var row1checked = true;
    var row2checked = true;
    var row3checked = false;
    var row4checked = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        if indexPath.row == 0 {
            label.text = "Walk the dog"
        }else if indexPath.row == 1 {
            label.text = "Brush my teeth"
        }else if indexPath.row == 2 {
            label.text = "Learn iOS development"
        }else if indexPath.row == 3 {
            label.text = "Soccer practice"
        }else if indexPath.row == 4 {
            label.text = "Eat ice cream"
        }
        
        
        configureCheckmark(for: cell, at: indexPath)
        return cell;
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            
            if indexPath.row == 0 {
                row0checked = !row0checked
            }else if indexPath.row == 1 {
                row1checked = !row1checked

            }else if indexPath.row == 2 {
                row2checked = !row2checked
                
            }else if indexPath.row == 3 {
                row3checked = !row3checked
                
            }else if indexPath.row == 4 {
                row4checked = !row4checked
                
            }
           configureCheckmark(for: cell, at: indexPath)
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        var isChecked = false
        
        if indexPath.row == 0 {
            isChecked = row0checked
        }else if indexPath.row == 1 {
            isChecked = row1checked
        }else if indexPath.row == 2 {
            isChecked = row2checked
        }else if indexPath.row == 3 {
            isChecked = row3checked
        }else if indexPath.row == 4 {
            isChecked = row4checked
        }
        if isChecked {
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

