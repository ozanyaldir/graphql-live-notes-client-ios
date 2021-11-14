//
//  graphql_live_notesApp.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 28.10.2021.
//

import SwiftUI

@main
struct graphql_live_notesApp: App {
    
    @StateObject var authentication = Authentication()
    
    var body: some Scene {
        WindowGroup {
            if authentication.isLoggedIn ?? false {
                withAnimation {
                    MainView().environmentObject(authentication)
                }
            }
            else{
                withAnimation {
                    LoginView().environmentObject(authentication)
                }
            }
        }
    }
}
