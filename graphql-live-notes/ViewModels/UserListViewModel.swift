//
//  UserListViewModel.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 11.11.2021.
//

import Foundation
import Apollo

class UserListViewModel: ObservableObject{
    
    @Published var users: [UserListUserViewModel] = []
    
    func getUserList(){
        let query = ListUsersQuery()
        Network.shared.apollo.fetch(query: query) {result in
            switch result{
            case .success(let graphQLResult):
                if let users = graphQLResult.data?.users{
                    DispatchQueue.main.async {
                        self.users = users.map(UserListUserViewModel.init)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}


struct UserListUserViewModel{
    fileprivate let user: ListUsersQuery.Data.User
    
    var id: GraphQLID{
        user.id
    }
    var username: String{
        user.username
    }
    var createdAt: String{
        user.createdAt
    }
    var notes: [UserListNoteViewModel]{
        user.notes.map(UserListNoteViewModel.init)
    }
}

struct UserListNoteViewModel {
    fileprivate let note: ListUsersQuery.Data.User.Note
    
    var id: GraphQLID{
        note.id
    }
    var text: String{
        note.text
    }
    var createdAt: String{
        note.createdAt
    }
}
