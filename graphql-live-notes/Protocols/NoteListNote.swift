//
//  NoteListNote.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 14.11.2021.
//

import Foundation
import Apollo

protocol NoteListNote{
    
    var id: GraphQLID{
        get
    }
    var text: String{
        get
    }
    var createdAt: String{
        get
    }
//    var user: NoteUser?{
//        get
//    }
}
