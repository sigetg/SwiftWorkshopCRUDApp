//
//  ContentView.swift
//  SwiftWorkshopCRUDApp
//
//  Created by George Sigety on 10/23/23.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @State private var sheetIsPresented = false // controls weather the sheet is showing on top of the page
    @Query var toDos : [ToDo] //query list of toDos from database
    @Environment(\.modelContext) var modelContext // Add model context
    
    var body: some View {
        NavigationStack { // Stack that keeps track of the navigation within your app
            List(toDos) { toDo in
//                Text("String")
                NavigationLink { // Links to a detail view for each of your toDos in the list
                    DetailView(toDo: toDo)
                } label: { // label of the link
                    Text(toDo.item)
                }
                .font(.title2)
                .swipeActions { // creates swipe actions on each list item
                    Button("Delete", role: .destructive) {
                        modelContext.delete(toDo) // deletes list item from database using your modelContext object's delete method
                    }
                }
            }
            .navigationTitle("To Do List")
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $sheetIsPresented) { // uses condtional variable to show a "sheet" page that comes up from the bottom of the screen
                NavigationStack {
                    DetailView(toDo: ToDo()) // populates sheet page with empty Detail View for ToDo creation
                }
            }
        }
    }
}

#Preview {
    ToDoListView()
}



