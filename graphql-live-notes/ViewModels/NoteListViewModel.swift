//
//  NoteListViewModel.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 11.11.2021.
//


import Foundation
import Apollo

class NoteListViewModel: ObservableObject{
    
    @Published var notes: [NoteListNoteViewModel] = []
    
    func getNoteList(){
        let query = ListNotesQuery()
        Network.shared.apollo.fetch(query: query) {result in
            switch result{
            case .success(let graphQLResult):
                if let notes = graphQLResult.data?.notes{
                    DispatchQueue.main.async {
                        self.notes = notes.map(NoteListNoteViewModel.init)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct NoteListNoteViewModel{
    fileprivate let note: ListNotesQuery.Data.Note
    
    var id: String{
        note.id
    }
    var text: String{
        note.text
    }
    var createdAt: String{
        note.createdAt
    }
    var user: NoteListUserViewModel{
        NoteListUserViewModel.init(user: note.user)
    }
}


struct NoteListUserViewModel{
    fileprivate let user: ListNotesQuery.Data.Note.User
    
    var id: String{
        user.id
    }
    var username: String{
        user.username
    }
    var createdAt: String{
        user.createdAt
    }
}

