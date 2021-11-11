//
//  graphql_live_notesApp.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 28.10.2021.
//

import SwiftUI

@main
struct graphql_live_notesApp: App {
    let persistenceController = PersistenceController.shared
    
    
    var body: some Scene {
        WindowGroup {
            //            ContentView()
            //                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
            MainView()
        }
    }
}
