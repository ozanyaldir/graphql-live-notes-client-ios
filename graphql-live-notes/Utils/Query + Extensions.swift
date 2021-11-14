//
//  Query + Extensions.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 14.11.2021.
//

import Foundation
import Apollo

extension ListNotesQuery.Data.Note.User: NoteUser {}
extension GetNoteQuery.Data.Note.User: NoteUser {}
extension WatchNewNotesSubscription.Data.Note.User: NoteUser {}

extension ListUsersQuery.Data.User.Note: UserNote {}
extension GetUserQuery.Data.User.Note: UserNote {}


extension ListNotesQuery.Data.Note: NoteListNote {}
extension WatchNewNotesSubscription.Data.Note: NoteListNote {}
