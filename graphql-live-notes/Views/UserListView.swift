//
//  UserListView.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 10.11.2021.
//

import SwiftUI
import Apollo
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
                let query = GetMeQuery()
                Network.shared.apollo.fetch(query: query) {result in
                    switch result{
                    case .success(let graphQLResult):
                        dump(graphQLResult.data?.me)
//                        if let users = graphQLResult.data?.users{
//                            DispatchQueue.main.async {
//                                self.users = users.map(UserListUserViewModel.init)
//                            }
//                        }
                    case .failure(let error):
                        print(error)
                    }
                }
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
