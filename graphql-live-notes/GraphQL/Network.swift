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
    let graphEndpoint: String! = (Bundle.main.object(forInfoDictionaryKey: "GRAPH_ENDPOINT") as! String)
    private(set) lazy var apollo = ApolloClient(url: URL(string: graphEndpoint)!)
    
    private init(){ }
}

