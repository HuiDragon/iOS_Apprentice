//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Liuguiliang on 2017/8/9.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

import Foundation
class ChecklistItem:NSObject {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
