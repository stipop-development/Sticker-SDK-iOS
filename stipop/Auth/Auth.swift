//
//  Auth.swift
//  Stipop
//
//  Created by Le Kim Tuan on 25/02/2021.
//

import UIKit

@objc public class Auth: NSObject {
    static var apiKey: String!
    static var needLogDebug: Bool!
    
    /// Setup Auth by providing your API key
    static func setup(apiKey: String, needLogDebug: Bool) {
        Auth.apiKey = apiKey
        Auth.needLogDebug = needLogDebug
    }
    
    static func getAPIKey() -> String {
        guard let apiKey = apiKey else {
            fatalError("Did not set apiKey yet!!!")
        }
        return apiKey
    }
    
    static func getNeedLogDebug() -> Bool {
        guard let needLogDebug = needLogDebug else {
            fatalError("Did not set needLogDebug yet!!!")
        }
        return needLogDebug
    }
}
