//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Liuguiliang on 2017/8/8.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    //This declare that items will hold an array of ChecklistItem objects
    //but it does not actually create that array.
    //At this point, items does not have a value yet.
    var items: [ChecklistItem]
    
    //This instantiates the array. Now items contains a valid array object,
    //but the array has no ChecklistItem objects inside it yet.
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        
        //This instantiates a new ChecklistItem objec. Notice the ().
        let row0item = ChecklistItem()
        
        //Give values to the data items inside the new ChecklistItem object.
        row0item.text = "Walk the dog"
        row0item.checked = false
        
        //This adds the CheclistItem object into the items array.
        items.append(row0item)
        
        let row1item = ChecklistItem()
        row1item.text = "Brush my teeth"
        row1item.checked = true
        items.append(row1item)
        
        let row2item = ChecklistItem()
        row2item.text = "Learn iOS development"
        row2item.checked = true
        items.append(row2item)
        
        let row3item = ChecklistItem()
        row3item.text = "Soccer practice"
        row3item.checked = false
        items.append(row3item)
        
        let row4item = ChecklistItem()
        row4item.text = "Eat ice cream"
        row4item.checked = true
        items.append(row4item)
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = items[indexPath.row]
        
        configureCellText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell;
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            
            let item = items[indexPath.row]
            
            item.toggleChecked()
            configureCheckmark(for: cell, with:item)
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    func configureCellText(for cell: UITableViewCell, with item: ChecklistItem)  {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        
        if item.checked {
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }
        
        
    }
    
    @IBAction func addItem () {
        
        let newRowIndex = items.count
        
        let item = ChecklistItem()
        item.text = "this is new item"
        item.checked = false
        items.append(item)
        
        let newIndexPath = IndexPath(row: newRowIndex, section: 0)
        let newIndexPaths = [newIndexPath]
        
        tableView.insertRows(at: newIndexPaths, with: .automatic)
    }
}

