//
//  StipopStickerCard.swift
//  Stipop
//
//  Created by Le Kim Tuan on 27/02/2021.
//

import UIKit

/**
 StipopStickerCard object
 
 - cardId: Card ID
 - cardTitle: Card title (ex. This month's best stickers)
 - cardType: Card type (ex. 1, 2, 3. etc.)
 - cardImgUrl: Card image
 - packageList: List of stickers within the sticker package
 */
public struct StipopStickerCard: Codable {
    public let cardId: Int
    public let cardTitle: String
    public let cardType: Int
    public let cardImgUrl: String?
    public let packageList: [StipopPackage]
    
    enum CodingKeys: String, CodingKey {
        case cardId, cardTitle, cardType, cardImgUrl, packageList
    }
}

public struct DataStipopStickerCardList: Codable {
    public let cardInfo: StipopStickerCard
    
    enum CodingKeys: String, CodingKey {
        case cardInfo
    }
}
