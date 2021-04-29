//
//  StipopPackage.swift
//  Stipop
//
//  Created by Le Kim Tuan on 25/02/2021.
//

import UIKit

public struct DataStipopPackageList: Codable {
    
    public let packageList: [StipopPackage]
    public let pageMap: PageMap?
    
    enum CodingKeys: String, CodingKey {
        case packageList, pageMap
    }
}

public struct DataPackageStipopSticker: Codable {
    public let package: StipopPackage
    
    enum CodingKeys: String, CodingKey {
        case package
    }
}

/**
 StipopPackage object.
 
 - packageId: Sticker package ID.
 - packageName: Sticker package name.
 - packageImg: Main image of sticker package.
 - packageCategory: Sticker package category.
 - packageKeywords: Sticker package keyword.
 - packageAnimated: Is sticker animated (Y/N).
 - isNew: Is sticker new (Y/N).
 - artistName: Name of the artist.
 - language: Main language of sticker package.
 - isDownload: Is sticker downloaded by the user (Y/N).
 - isWish: Is sticker in wish list (Y/N).
 - stickers: List of stickers within the sticker package.
 - tags: Sticker tag
 */
public struct StipopPackage: Codable {
    public let packageId: Int
    public let artistName: String
    public let packageName: String
    public let packageImg: String
    public let packageAnimated: String?
    public let packageCategory: String?
    public let packageKeywords: String?
    public let isNew: String?
    public let language: String?
    public let isDownload: String?
    public let isWish: String?
    public let stickers: [StipopSticker]?
    public let tags: String?
    
    enum CodingKeys: String, CodingKey {
        case packageId, artistName, packageName, packageImg, packageAnimated, packageCategory, packageKeywords, isNew, language, isDownload, isWish, stickers, tags
    }
}
