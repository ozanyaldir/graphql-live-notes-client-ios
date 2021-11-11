//
//  UserListView.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 10.11.2021.
//

import SwiftUI

struct UserListView: View {
    
    @StateObject private var userListVM = UserListViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack{
                List(userListVM.users, id: \.id){ user in
                    VStack{
                        NavigationLink(
                            destination: UserDetailView(userId: user.id)
                        ) {
                            HStack{
                                Text("\(user.username)").bold()
                            }
                        }
                    }
                }
            }
            .onAppear {
                userListVM.getUserList()
            }
            .navigationBarTitle(Text("Users"), displayMode: .inline)
        }
    }
}

struct UserListView_Previews: PreviewProvider{
    static var previews: some View{
        UserListView()
    }
}
