//
//  ToDoItem.swift
//  SwiftWorkshopCRUDApp
//
//  Created by George Sigety on 10/23/23.
//

import Foundation
import SwiftData

@Model // Right click and choose show macro to show some more detailed code added automatically by apple!
class ToDo: Identifiable {
    var id = UUID().uuidString
    var item = ""
    var reminderIsOn = false
    var dueDate = Date.now + (60*60*24)
    var notes = ""
    var isCompleted = false
    
    init() {
//        self.id = UUID().uuidString
//        self.item = item
//        self.reminderIsOn = reminderIsOn
//        self.dueDate = dueDate
//        self.notes = notes
//        self.isCompleted = isCompleted
    }
}
