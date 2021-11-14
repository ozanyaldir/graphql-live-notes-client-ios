//
//  Authentication.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 13.11.2021.
//

import Foundation

class Authentication: ObservableObject {
    
    enum AuthResult {
        case success(username: String, accessToken: String)
        case failure
    }
    
    @Published private(set) var isLoggedIn: Bool?
    private(set) var accessToken: String?
    private(set) var username: String?
    
    init(){
        
        guard
            let accessTokenData = KeychainHelper.standard.read(service: "access-token", account: "live-notes"),
            let accessToken = String(data: accessTokenData, encoding: .utf8),
            !accessToken.isEmpty
        else{
            self.isLoggedIn = false
            self.accessToken = nil
            self.username = nil
            return
        }
        
        guard
            let usernameData = KeychainHelper.standard.read(service: "username", account: "live-notes"),
            let username = String(data: usernameData, encoding: .utf8),
            !username.isEmpty
        else{
            self.isLoggedIn = false
            self.accessToken = nil
            self.username = nil
            return
        }
        
        self.isLoggedIn = true
        self.accessToken = accessToken
        self.username = username
    }
    
    func updateAuth(result: AuthResult) {
        switch result {
        case .success(let username, let accessToken):
            guard !accessToken.isEmpty, !username.isEmpty else{
                KeychainHelper.standard.delete(service: "username", account: "live-notes")
                KeychainHelper.standard.delete(service: "access-token", account: "live-notes")
                self.accessToken = nil
                self.isLoggedIn = false
                return
            }
            let usernameData = Data(username.utf8)
            KeychainHelper.standard.save(usernameData, service: "username", account: "live-notes")
            let accessTokenData = Data(accessToken.utf8)
            KeychainHelper.standard.save(accessTokenData, service: "access-token", account: "live-notes")
            self.accessToken = accessToken
            Network.shared.resetClient()
            self.isLoggedIn = true
        case .failure:
            KeychainHelper.standard.delete(service: "access-token", account: "live-notes")
            KeychainHelper.standard.delete(service: "username", account: "live-notes")
            self.accessToken = nil
            self.username = nil
            Network.shared.resetClient()
            self.isLoggedIn = false
        }
    }
}
