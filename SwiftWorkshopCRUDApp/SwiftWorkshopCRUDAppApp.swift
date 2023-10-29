//
//  SwiftWorkshopCRUDAppApp.swift
//  SwiftWorkshopCRUDApp
//
//  Created by George Sigety on 10/23/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftWorkshopCRUDAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .modelContainer(for: ToDo.self) // Indicate a list of models in array if you have more than one!
        }
    }
}
