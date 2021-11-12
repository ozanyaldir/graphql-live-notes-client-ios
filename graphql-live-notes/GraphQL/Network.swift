//
//  Network.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 30.10.2021.
//

import Foundation
import Apollo


class Network {
    
    static let shared = Network()
    private(set) var apollo: ApolloClient!
    
    private init(){
//        let data = Data(Constants.AccessTokens.mockAccessToken.utf8)
//        KeychainHelper.standard.save(data, service: "access-token", account: "live-notes")
        self.resetClient()
    }
    
}

extension Network {
    
    open func resetClient(){
        let url = URL(string: Constants.URLs.liveNotesGraphQLAPIURL)!
        
        guard
            let data = KeychainHelper.standard.read(service: "access-token", account: "live-notes"),
            let accessToken = String(data: data, encoding: .utf8),
            !accessToken.isEmpty
        else{
            self.apollo = ApolloClient(url: url)
            return
        }
        let configuration = URLSessionConfiguration.default
        let store = ApolloStore()
        configuration.httpAdditionalHeaders = ["Authorization": accessToken]
        
        let sessionClient = URLSessionClient.init(sessionConfiguration: configuration, callbackQueue: nil)
        let provider = DefaultInterceptorProvider.init(client: sessionClient, shouldInvalidateClientOnDeinit: true, store: store)
        let requestChainTransport = RequestChainNetworkTransport.init(interceptorProvider: provider, endpointURL: url)
        
        self.apollo = ApolloClient.init(networkTransport: requestChainTransport, store: store)
        
    }
}
