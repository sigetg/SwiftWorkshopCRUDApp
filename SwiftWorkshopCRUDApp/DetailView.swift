//
//  DetailView.swift
//  SwiftWorkshopCRUDApp
//
//  Created by George Sigety on 10/23/23.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss // Allows for call to dismiss in the "Cancel" toolbar item
    @Environment(\.modelContext) var modelContext // Add model context
    @State var toDo: ToDo // Stores the ToDo passed in in the call to DetailView
    
    var body: some View {
        VStack { //Vertical stack of UI Elements
            TextField("Enter To Do Here", text: $toDo.item)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
            Toggle("Set Reminder:", isOn: $toDo.reminderIsOn)
                .padding(.top)
            DatePicker("Date", selection: $toDo.dueDate)
                .padding(.bottom)
                .disabled(!toDo.reminderIsOn) //disables view based on a boolean
            HStack { //Horizontal stack of UI Elements
                Text("Notes:")
                Spacer()
            }
                .padding(.top)
            TextField("Notes", text: $toDo.notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
            Toggle("Completed:", isOn: $toDo.isCompleted)
                .padding(.top)
            Spacer() //element that takes up space and pushes other elements around on the screen based on its placement
        }
        .padding() // adds some whitespace around your view
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    modelContext.insert(toDo) // replace the saved todo in the database with the current state of the toDo variable
                    dismiss() // pops view from navigation stack
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(toDo: ToDo())
        .modelContainer(for: ToDo.self)
}
