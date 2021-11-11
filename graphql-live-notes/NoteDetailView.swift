//
//  NoteDetailView.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 10.11.2021.
//

import SwiftUI

struct NoteDetailView: View {
    
    let noteId: String
    @StateObject private var noteDetailVM = NoteDetailViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Text("Username: " + (noteDetailVM.user?.username ?? "")).bold()
                }
            }
            .onAppear {
                noteDetailVM.getNoteDetail(noteId: noteId)
            }
            .navigationBarTitle(Text(self.noteDetailVM.text), displayMode: .inline)
        }
    }
}

struct NoteDetailView_Previews: PreviewProvider{
    static var previews: some View{
        NoteDetailView.init(noteId: "618c1ce3669e8162adb7f0ef")
    }
}
