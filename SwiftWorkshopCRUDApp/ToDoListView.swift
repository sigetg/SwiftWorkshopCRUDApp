//
//  ContentView.swift
//  SwiftWorkshopCRUDApp
//
//  Created by George Sigety on 10/23/23.
//

// import section
import SwiftUI
import SwiftData

// view structure section
struct ToDoListView: View {
    // variable declarations (@ = property wrappers)
    @State private var sheetIsPresented = false // a variable that controls whether "the sheet" is showing
    @Query private var toDos : [ToDo] // query the array of toDos from database
    @Environment(\.modelContext) private var modelContext // bring in the modelContext to the environment (this enables CRUD)
    
    var body: some View {
        NavigationStack { // stack that keeps track of the navigation within your app
            List { // list takes in an array and creates a scrollable column with the items
                ForEach(toDos) { toDo in
                    //Text("String")
                    NavigationLink { // links that leads the user to a detailed view for each of the toDos in the list
                        DetailView(toDo: toDo)
                    } label: { // determines what the label of the link is
                        Text(toDo.item)
                    }
                    .font(.title2) // dot modifiers allow us to access properties (this one determines the font size)
                    .swipeActions { // creates a feature that responds to swipe actions on each list item
                        Button("Delete", role: .destructive) { // swiping on the item will show a delete button
                            modelContext.delete(toDo) // deletes list item from database using the modelContext object's delete method
                        }
                    }
                }
            }
            .navigationTitle("To Do List") // determines the title of the List
            .listStyle(.plain) // determines style of the List
            .toolbar { // the toolbar allows us to make button items along the top or the bottom of the screen
                ToolbarItem(placement: .topBarTrailing) { // in this case there will be a button on the top right side
                    Button {
                        sheetIsPresented.toggle() // touching the button will toggle the sheetIsPresented from false to true
                    } label: {
                        Image(systemName: "plus") // the label for this button will be the built-in "+" sign from SF Symbols
                    }
                }
            }
            .sheet(isPresented: $sheetIsPresented) { // uses conditional variable to show a "sheet" page that comes up from the bottom of the screen
                NavigationStack {
                    DetailView(toDo: ToDo()) // populates sheet page with empty Detail View for toDo creation
                }
            }
        }
    }
}

// setting up for preview section
#Preview {
    ToDoListView()
}
