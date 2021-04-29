//
//  StipopCategory.swift
//  Stipop
//
//  Created by Le Kim Tuan on 28/02/2021.
//

import UIKit

/**
 StipopStickerCard object
 
 - category: Different categories used in Stipop Sticker Library to sort stickers.
 */
public struct StipopCategory: Codable {
    public let category: String
    
    enum CodingKeys: String, CodingKey {
        case category
    }
}

public struct DataStipopCategoryList: Codable {
    public let categoryList: [StipopCategory]
    
    enum CodingKeys: String, CodingKey {
        case categoryList
    }
}
