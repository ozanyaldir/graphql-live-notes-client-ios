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
        Network.shared.apollo.fetch(query: query) {[unowned self] result in
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
    
    func watchNewNotes(){
        let subscription = WatchNewNotesSubscription.init()
        Network.shared.apollo.subscribe(subscription: subscription) {[unowned self] result in
            switch result{
            case .success(let graphQLResult):
                if let newNote = graphQLResult.data?.note{
                    DispatchQueue.main.async {
                        self.notes.insert(NoteListNoteViewModel.init(note: newNote), at: 0)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct NoteListNoteViewModel{
    fileprivate let note: NoteListNote
    
    var id: GraphQLID{
        note.id
    }
    var text: String{
        note.text
    }
    var createdAt: String{
        note.createdAt
    }
//    var user: NoteListUserViewModel?{
//        return NoteListUserViewModel.init(user: note.user)
//    }
}


struct NoteListUserViewModel{
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

