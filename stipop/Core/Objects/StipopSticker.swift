//
//  StipopSticker.swift
//  Stipop
//
//  Created by Le Kim Tuan on 25/02/2021.
//

import UIKit

/**
 StipopSticker object
 
 - packageId: Sticker package ID.
 - stickerId: Sticker ID.
 - stickerImg: Sticker image url.
 - sendCnt: Number of times the sticker has been used/sent.
 - `keyword`: Search tag
 */
public struct StipopSticker: Codable {
    public let stickerId: Int
    public let packageId: Int?
    public let stickerImg: String
    public let sendCnt: Int?
    public let keyword: String?
    
    enum CodingKeys: String, CodingKey {
        case stickerId, packageId, stickerImg, sendCnt, keyword
    }
}

public struct DataStipopStickerList: Codable {
    public let stickerList: [StipopSticker]
    public let pageMap: PageMap?
    
    enum CodingKeys: String, CodingKey {
        case stickerList, pageMap
    }
}
