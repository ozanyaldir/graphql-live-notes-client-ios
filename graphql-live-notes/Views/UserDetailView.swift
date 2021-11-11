//
//  UserListView.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 10.11.2021.
//

import SwiftUI

struct UserDetailView: View {
    
    let userId: String
    @StateObject var userDetailVM = UserDetailViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack{
                List(userDetailVM.notes, id: \.id){ note in
                    Text(note.text)
                }
            }
            .onAppear {
                userDetailVM.getUserDetail(userId: self.userId)
            }
            .navigationTitle("\(self.userDetailVM.username)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct UserDetailView_Previews: PreviewProvider{
    static var previews: some View{
        UserDetailView(userId: "61796e21746f3de80d1ac95b")
    }
}
