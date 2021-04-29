//
//  StipopBanner.swift
//  Stipop
//
//  Created by Le Kim Tuan on 27/02/2021.
//

import UIKit

/**
 StipopBanner object
 
 - bannerId: banner ID
 - packageId: Sticker package ID
 - bannerImg: banner image
 */
public struct StipopBanner: Codable {
    public let bannerId: Int
    public let packageId: Int
    public let bannerImg: String
    
    enum CodingKeys: String, CodingKey {
        case bannerId, packageId, bannerImg
    }
}

public struct DataStipopBannerList: Codable {
    public let bannerList: [StipopBanner]
    
    enum CodingKeys: String, CodingKey {
        case bannerList
    }
}
