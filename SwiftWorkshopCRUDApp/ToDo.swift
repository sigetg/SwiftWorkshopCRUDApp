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
    var id: String
    var item: String
    var reminderIsOn: Bool
    var dueDate: Date
    var notes: String
    var isCompleted: Bool
    
    init() {
        self.id = UUID().uuidString
        self.item = ""
        self.reminderIsOn = false
        self.dueDate = Date.now + (60*60*24)
        self.notes = ""
        self.isCompleted = false
    }
}
