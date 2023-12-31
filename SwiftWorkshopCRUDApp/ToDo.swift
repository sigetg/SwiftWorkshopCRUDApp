//
//  ToDoItem.swift
//  SwiftWorkshopCRUDApp
//
//  Created by George Sigety on 10/23/23.
//

import Foundation // allows us to access the current date
import SwiftData // allows us to use Apple's built-in database for data persistence

@Model // right click and choose show macro to show some more detailed code added automatically by Apple!
class ToDo {
    var item: String
    var reminderIsOn: Bool
    var dueDate: Date
    var notes: String
    var isCompleted: Bool
    
    init() {
        self.item = ""
        self.reminderIsOn = false
        self.dueDate = Date.now + (60*60*24)
        self.notes = ""
        self.isCompleted = false
    }
}
