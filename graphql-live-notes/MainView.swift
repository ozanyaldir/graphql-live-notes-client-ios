//
//  MainView.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 11.11.2021.
//

import Foundation

import SwiftUI
import CoreData
import Network

struct MainView: View {
    var body: some View {
        TabView {
            UserListView()
                .tabItem {
                    Label("Users", systemImage: "list.dash")
                }
            
            NoteListView()
                .tabItem {
                    Label("Notes", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider{
    static var previews: some View{
        MainView()
    }
}
