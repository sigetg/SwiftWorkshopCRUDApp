//
//  DetailView.swift
//  SwiftWorkshopCRUDApp
//
//  Created by George Sigety on 10/23/23.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var modelContext // Add model context
    @State var toDo: ToDo
    
    var body: some View {
        VStack {
            TextField("Enter To Do Here", text: $toDo.item)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
            Toggle("Set Reminder:", isOn: $toDo.reminderIsOn)
                .padding(.top)
            DatePicker("Date", selection: $toDo.dueDate)
                .padding(.bottom)
                .disabled(!toDo.reminderIsOn)
            HStack {
                Text("Notes:")
                Spacer()
            }
                .padding(.top)
            TextField("Notes", text: $toDo.notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
            Toggle("Completed:", isOn: $toDo.isCompleted)
                .padding(.top)
            Spacer()
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    modelContext.insert(toDo)
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(toDo: ToDo())
        .modelContainer(for: ToDo.self)
}
