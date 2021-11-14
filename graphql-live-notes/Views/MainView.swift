//
//  MainView.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 11.11.2021.
//

import Foundation
import SwiftUI


struct MainView: View {
    
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        TabView {
            NoteListView()
                .tabItem {
                    Label("Notes", systemImage: "square.and.pencil")
                }
            UserListView()
                .tabItem {
                    Label("Users", systemImage: "list.dash")
                }
        }
        
    }
    
}

struct MainView_Previews: PreviewProvider{
    static var previews: some View{
        MainView()
    }
}

