//
//  BaseID.swift
//  Mandiri-Felinda-iOS
//
//  Created by Felinda Lubis on 13/02/23.
//

import Foundation

struct BaseID {
    static let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as! String
    static let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as! String
    static let kVersion = "v2"
}


protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum News: Endpoint {
        
        case category(category: String)
        case everything(category: String, source: String)
        
        public var path: String {
            switch self {
            case .category(let category):
                return "/top-headlines/sources?category=\(category)&apiKey=\(BaseID.apiKey)"
            case .everything(let category, let source):
                return "/everything?q=\(category)&sources=\(source)&apiKey=\(BaseID.apiKey)"
            }
        }
        
        public var url: String {
            return BaseID.baseURL + BaseID.kVersion + path
        }
    }
}
