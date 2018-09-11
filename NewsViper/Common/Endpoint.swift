//
//  Endpoint.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation


struct API {
    static let baseUrl = "http://feeds.bbci.co.uk";
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum News: Endpoint {
        case fetch
        
        public var path: String {
            switch self {
                case .fetch: return "/news/world/rss.xml"
            }
        }
        
        public var url: String {
            switch self {
                case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
