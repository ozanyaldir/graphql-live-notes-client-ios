//
//  NoteUser.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 14.11.2021.
//

import Foundation
import Apollo

protocol NoteUser{
    
    var id: GraphQLID{
        get
    }
    var username: String{
        get
    }
    var createdAt: String{
        get
    }
}
