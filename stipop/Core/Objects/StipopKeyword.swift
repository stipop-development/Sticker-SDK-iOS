//
//  StipopKeyword.swift
//  Stipop
//
//  Created by Le Kim Tuan on 27/02/2021.
//

import UIKit

/**
 StipopKeyword object
 
 - `keyword`: Search suggestion tag
 */
public struct StipopKeyword: Codable {
    public let keyword: String
    
    enum CodingKeys: String, CodingKey {
        case keyword
    }
}

public struct DataStipopKeywordList: Codable {
    public let keywordList: [StipopKeyword]
    
    enum CodingKeys: String, CodingKey {
        case keywordList
    }
}
