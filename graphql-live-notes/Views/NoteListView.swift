//
//  NoteListView.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 10.11.2021.
//

import SwiftUI

struct NoteListView: View {
    
    @StateObject private var noteListVM = NoteListViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                List(noteListVM.notes, id: \.id){ note in
                    VStack{
                        NavigationLink(
                            destination: NoteDetailView(noteId: note.id)
                        ) {
                            HStack{
                                Text("\(note.text)").bold()
                            }
                        }
                    }
                }
            }
            .onAppear {
                noteListVM.getNoteList()
            }
            .navigationBarTitle(Text("Notes"), displayMode: .inline)
        }
    }
}

struct NoteListView_Previews: PreviewProvider{
    static var previews: some View{
        NoteListView()
    }
}
