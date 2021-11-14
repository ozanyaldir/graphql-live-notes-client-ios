//
//  NoteDetailViewModel.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 11.11.2021.
//

import Foundation
import Apollo

class NoteDetailViewModel: ObservableObject{
    @Published private var note: GetNoteQuery.Data.Note?
    
    var id: GraphQLID{
        note?.id ?? ""
    }
    var text: String{
        note?.text ?? ""
    }
    var createdAt: String{
        note?.createdAt ?? ""
    }
    var user: NoteDetailUserViewModel?{
        guard let user = note?.user else{ return nil }
        return NoteDetailUserViewModel.init(user: user)
    }
    
    func getNoteDetail(noteId: String){
        let query = GetNoteQuery(noteId: noteId)
        Network.shared.apollo.fetch(query: query) {result in
            switch result{
            case .success(let graphQLResult):
                if let note = graphQLResult.data?.note{
                    DispatchQueue.main.async {
                        self.note = note
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct NoteDetailUserViewModel {
    fileprivate let user: NoteUser
    
    var id: GraphQLID{
        user.id
    }
    var username: String{
        user.username
    }
    var createdAt: String{
        user.createdAt
    }
}
