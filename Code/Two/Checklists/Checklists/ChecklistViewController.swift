//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Liuguiliang on 2017/8/8.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var row0Item: ChecklistItem
    var row1Item: ChecklistItem
    var row2Item: ChecklistItem
    var row3Item: ChecklistItem
    var row4Item: ChecklistItem
    
    //For the view controller that happens when it is loaded from the storyboard during app startup. At that point, its init?(coder) method is called
    required init?(coder aDecoder: NSCoder) {
        //you first create a new ChecklistItem object
        row0Item = ChecklistItem()
        //and then set the properties
        row0Item.text = "Walk the dog"
        row0Item.checked = false
        
        //You repeat this for the other four rows. Each row gets its own ChecklistItem object that you store in its own instance variable.
        
        
        row1Item = ChecklistItem()
        row1Item.text = "Brush my teeth"
        row1Item.checked = true
        
        row2Item = ChecklistItem()
        row2Item.text = "Learn iOS development"
        row2Item.checked = true
        
        row3Item = ChecklistItem()
        row3Item.text = "Soccer practice"
        row3Item.checked = false
        
        row4Item = ChecklistItem()
        row4Item.text = "Eat ice cream"
        row4Item.checked = true
        
        super.init(coder: aDecoder)
        
    }
    
//    var row0text = "Walk the dog"
//    var row1text = "Brush my teeth"
//    var row2text = "Learn iOS development"
//    var row3text = "Soccer practice"
//    var row4text = "Eat ice cream"
    
//    var row0checked = false;
//    var row1checked = true;
//    var row2checked = true;
//    var row3checked = false;
//    var row4checked = true;
    
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
            label.text = row0Item.text
        }else if indexPath.row == 1 {
            label.text = row1Item.text
        }else if indexPath.row == 2 {
            label.text = row2Item.text
        }else if indexPath.row == 3 {
            label.text = row3Item.text
        }else if indexPath.row == 4 {
            label.text = row4Item.text
        }
        
        
        configureCheckmark(for: cell, at: indexPath)
        return cell;
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            
            if indexPath.row == 0 {
                row0Item.checked = !row0Item.checked
            }else if indexPath.row == 1 {
                row1Item.checked = !row1Item.checked

            }else if indexPath.row == 2 {
                row2Item.checked = !row2Item.checked
                
            }else if indexPath.row == 3 {
                row3Item.checked = !row3Item.checked
                
            }else if indexPath.row == 4 {
                row4Item.checked = !row4Item.checked
                
            }
           configureCheckmark(for: cell, at: indexPath)
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        var isChecked = false
        
        if indexPath.row == 0 {
            isChecked = row0Item.checked
        }else if indexPath.row == 1 {
            isChecked = row1Item.checked
        }else if indexPath.row == 2 {
            isChecked = row2Item.checked
        }else if indexPath.row == 3 {
            isChecked = row3Item.checked
        }else if indexPath.row == 4 {
            isChecked = row4Item.checked
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

