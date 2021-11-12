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
//                        NavigationLink(
//                            destination: NoteDetailView(noteId: note.id)
//                        ) {
//                            HStack{
//                                Text("\(note.text)").bold()
//                            }
//                            .flip()
//                        }
                        if note.user.id == "6170a33f1b587b2cec7cca37"{
                            HStack{
                                Spacer(minLength: 20)
                                Text("\(note.text)")
                            }
                            .flip()
                        } else{
                            HStack{
                                Text("\(note.text)")
                                Spacer(minLength: 20)
                            }
                            .flip()
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .flip()
                .listStyle(.plain)
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

extension View {
    public func flip() -> some View {
        return self
            .rotationEffect(.radians(.pi))
            .scaleEffect(x: -1, y: 1, anchor: .center)
    }
}
