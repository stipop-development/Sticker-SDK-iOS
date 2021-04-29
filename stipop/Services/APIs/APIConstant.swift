//
//  APIConstant.swift
//  stipop
//
//  Created by Le Kim Tuan on 19/02/2021.

import Foundation

struct EndPoint {
    static var baseURL: String {
        return "https://messenger.stipop.io/v1"
    }
}

struct APIParamKey {
    static let authorization = "Authorization"
    static let lang = "lang"
    static let contentType = "Content-Type"
    static let apikey = "apikey"
    static let userID = "userId"
    static let pageNumber = "pageNumber"
    static let date = "date"
    static let category = "category"
    static let animated = "animated"
    static let countryCode = "countryCode"
    static let searchText = "searchText"
    static let packID = "packId"
    static let price = "price"
    
    static let q = "q"
    static let limit = "limit"
    static let isPurchase = "isPurchase"
}

struct Constant {
    static let accessToken = "user-accessToken"
    static let installedAppBefore = "user-launchedAppBefore"
    static let dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
    static let dateFormatOnlyDay = "yyyy-MM-dd"
    static let pathSaveQRCodeImage = "Bas-Health-QRCodeImage"
    static let appName = "BAS Health"
}
