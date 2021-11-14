//
//  UserDetailViewModel.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 11.11.2021.
//

import Foundation
import Apollo

class UserDetailViewModel: ObservableObject{
    @Published private var user: GetUserQuery.Data.User?
    
    var id: GraphQLID{
        user?.id ?? ""
    }
    var username: String{
        user?.username ?? ""
    }
    var createdAt: String{
        user?.createdAt ?? ""
    }
    
    var notes: [UserDetailNoteViewModel]{
        (user?.notes ?? []).map(UserDetailNoteViewModel.init)
    }
    
    func getUserDetail(userId: String){
        let query = GetUserQuery(userId: userId)
        Network.shared.apollo.fetch(query: query) {result in
            switch result{
            case .success(let graphQLResult):
                if let user = graphQLResult.data?.user{
                    DispatchQueue.main.async {
                        self.user = user
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct UserDetailNoteViewModel {
    fileprivate let note: UserNote
    
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
