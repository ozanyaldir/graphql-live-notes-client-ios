//
//  LoginViewModel.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 13.11.2021.
//

import Foundation
import Apollo


class LoginViewModel: ObservableObject{
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var errors: [ErrorViewModel] = []
    
    var loginDisabled: Bool {
        username.isEmpty || password.isEmpty
    }
    
    func login(completion: @escaping (_ result: Authentication.AuthResult) -> Void){
        guard !username.isEmpty,
              !password.isEmpty else{
                  //                  error = .invalidCredentials
                  return completion(.failure)
              }
        
        
        let signInInput = SignInInput.init(username: username, password: password)
        let mutation = SignInMutation.init(data: signInInput)
        Network.shared.apollo.perform(mutation: mutation){ result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors{
                    DispatchQueue.main.async {
                        self.errors = errors.map({ ErrorViewModel(message: $0.message) })
                    }
                    return
                }
                if let accessToken = graphQLResult.data?.signIn.token{
                    DispatchQueue.main.async {
                        completion(.success(username: self.username, accessToken: accessToken))
                    }
                }
                break
            case .failure(let error):
                
                    DispatchQueue.main.async {
                        self.errors.append(ErrorViewModel.init(message: error.localizedDescription))
                    }
                
                completion(.failure)
                break
            }
        }
        
        return
    }
}
