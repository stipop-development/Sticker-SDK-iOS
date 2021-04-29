//
//  APIs.swift
//  stipop
//
//  Created by Le Kim Tuan on 19/02/2021.

import Moya
import UIKit

public enum DateString: String {
    case daily = "Daily"
    case weekly = "Weekly"
    case monthly = "Monthly"
}

public enum BoolString: String {
    case `true` = "Y"
    case `false` = "N"
}

enum APIs {
    case searchStickers(q: String,
                        userID: String,
                        lang: String?,
                        countryCode: String?,
                        limit: Int?,
                        pageNumber: Int?)
    case trendingSearchTerms(lang: String?,
                             countryCode: String?,
                             limit: Int?)
    case searchRecent(userID: String)
    case topRankingStickerPackagesList(userID: String,
                                       lang: String?,
                                       countryCode: String?,
                                       limit: Int?,
                                       pageNumber: Int?,
                                       animated: String?)
    case getPackageStickerInfo(userID: String, packID: String)
    case downloadOrPurchaseSticker(packID: String,
                                   userId: String,
                                   isPurchase: String,
                                   lang: String?,
                                   countryCode: String?,
                                   price: String?)
    case newStickerPackages(userID: String,
                            lang: String?,
                            countryCode: String?,
                            limit: Int?,
                            pageNumber: Int?,
                            animated: String?)
    case getMainStickerBanners(userID: String,
                               lang: String?,
                               countryCode: String?,
                               limit: Int?)
    case getStickerCard(userID: String,
                        cardType: Int)
    case getRecentlyViewedPackages(userID: String,
                                   limit: Int?,
                                   pageNumber: Int?)
    case viewStickerCategory
    case registerStickerUsage(stickerID: Int,
                              userID: String,
                              q: String?,
                              lang:String?,
                              countryCode: String?)
    case getRecentlyUsedStickers(userID: String,
                                 limit: Int?,
                                 pageNumber: Int?)
    case getFrequentlyUsedStickers(userID: String,
                                   limit: Int?,
                                   pageNumber: Int?)
    case getMyStickerPackageList(userID: String,
                                 limit: Int?,
                                 pageNumber: Int?)
    case hideOrRecoverMySticker(userID: String,
                                packID: Int)
    case getHiddenStickersList(userID: String,
                               limit: Int?,
                               pageNumber: Int?)
    case getStickerPackageWishList(userID: String,
                                   limit: Int?,
                                   pageNumber: Int?)
    case addOrRemoveWishList(userID: String,
                             packID: Int)
    case getDownloadOrPurchaseHistory(userID: String,
                                      limit: Int?,
                                      pageNumber: Int?)
    case sendGiftPackage(packID: Int,
                         sendUserID: String,
                         receiveUserID: String)
    case confirmGiftPackage(packID: Int,
                            sendUserID: String,
                            receiveUserID: String)
    case getSentGiftPackageList(userID: String,
                                limit: Int?,
                                pageNumber: Int?)
    case getReceivedGiftPackageList(userID: String,
                                    limit: Int?,
                                    pageNumber: Int?)
}

extension APIs: TargetType {

    // MARK: - Base URL
    public var baseURL: URL {
        do {
            return try EndPoint.baseURL.asURL()
        } catch {
            fatalError("Please set Base URL")
        }
    }

    // MARK: - Path
    public var path: String {
        
        // MARK: - 여기
        switch self {
        
        case .searchStickers:
            return "/search"
        case .trendingSearchTerms(_, _, _):
            return "/search/keyword"
        case .searchRecent:
            return "/search/recent"
        case .topRankingStickerPackagesList:
            return "/package"
        case .getPackageStickerInfo(_, let packID):
            return "/package/\(packID)"
        case .downloadOrPurchaseSticker(let packID, _, _, _, _, _):
            return "/download/\(packID)"
        case .newStickerPackages:
            return "/package/new"
        case .getMainStickerBanners:
            return "/curation/banner"
        case .getStickerCard(_, let cardType):
            return "/curation/card/\(cardType)"
        case .getRecentlyViewedPackages(let userID, _, _):
            return "/package/recent/\(userID)"
        case .viewStickerCategory:
            return "/category"
        case .registerStickerUsage(let stickerID, _, _, _, _):
            return "/analytics/send/\(stickerID)"
        case .getRecentlyUsedStickers(let userID, _, _):
            return "/package/send/\(userID)"
        case .getFrequentlyUsedStickers(let userID, _, _):
            return "/package/frequently/\(userID)"
        case .getMyStickerPackageList(let userID, _, _):
            return "/mysticker/\(userID)"
        case .hideOrRecoverMySticker(let userID, let packID):
            return "/mysticker/hide/\(userID)/\(packID)"
        case .getHiddenStickersList(let userID, _, _):
            return "/mysticker/hide/\(userID)"
        case .getStickerPackageWishList(let userID, _, _):
            return "/wish/\(userID)"
        case .addOrRemoveWishList(_, let packID):
            return "/wish/\(packID)"
        case .getDownloadOrPurchaseHistory(let userID, _, _):
            return "/download/\(userID)"
        case .sendGiftPackage(let packID, let sendUserID, let receiveUserID):
            return "/gift/\(packID)/\(sendUserID)/\(receiveUserID)"
        case .confirmGiftPackage(let packID, let sendUserID, let receiveUserID):
            return "/gift/\(packID)/\(sendUserID)/\(receiveUserID)"
        case .getSentGiftPackageList(let userID, _, _):
            return "/gift/send/\(userID)"
        case .getReceivedGiftPackageList(let userID, _, _):
            return "/gift/receive/\(userID)"
        }
    }

    // MARK: - Method
    public var method: Moya.Method {
        switch self {
        case .topRankingStickerPackagesList, .getPackageStickerInfo, .getRecentlyViewedPackages, .getRecentlyUsedStickers, .getFrequentlyUsedStickers, .searchStickers, .trendingSearchTerms, .searchRecent, .newStickerPackages, .getMainStickerBanners, .getStickerCard, .getDownloadOrPurchaseHistory, .getStickerPackageWishList, .viewStickerCategory, .getMyStickerPackageList, .getHiddenStickersList, .getSentGiftPackageList, .getReceivedGiftPackageList:
            return .get
        case .downloadOrPurchaseSticker, .registerStickerUsage, .sendGiftPackage:
            return .post
        case .addOrRemoveWishList, .hideOrRecoverMySticker, .confirmGiftPackage:
            return .put
        }
    }

    // MARK: - Task
    public var task: Task {
        switch self {
        case .searchStickers(let q,
                             let userID,
                             let lang,
                             let countryCode,
                             let limit,
                             let pageNumber):
            return getParamOnlyContain(q: q,
                                       userID: userID,
                                       lang: lang,
                                       countryCode: countryCode,
                                       limit: limit,
                                       pageNumber: pageNumber)
        case .trendingSearchTerms(let lang,
                                  let countryCode,
                                  let limit):
            return getParamOnlyContain(lang: lang,
                                       countryCode: countryCode,
                                       limit: limit)
        case .searchRecent(let userID):
            return getParamOnlyContain(userID: userID)
        case .topRankingStickerPackagesList(let userID,
                                            let lang,
                                            let countryCode,
                                            let limit,
                                            let pageNumber,
                                            let animated):
            return getParamOnlyContain(userID: userID,
                                      lang: lang,
                                      countryCode: countryCode,
                                      limit: limit,
                                      pageNumber: pageNumber,
                                      animated: animated)
        case .getPackageStickerInfo(let userID, _):
            return getParamOnlyContain(userID: userID)
        case .downloadOrPurchaseSticker(_,
                                        let userID,
                                        let isPurchase,
                                        let lang,
                                        let countryCode,
                                        let price):
            return getParamOnlyContain(userID: userID,
                                       isPurchase: isPurchase,
                                       lang: lang,
                                       countryCode: countryCode,
                                       price: price)
        case .newStickerPackages(let userID,
                                 let lang,
                                 let countryCode,
                                 let limit,
                                 let pageNumber,
                                 let animated):
            return getParamOnlyContain(userID: userID,
                                       lang: lang,
                                       countryCode: countryCode,
                                       limit: limit,
                                       pageNumber: pageNumber,
                                       animated: animated)
        case .getMainStickerBanners(let userID,
                                    let lang,
                                    let countryCode,
                                    let limit):
            return getParamOnlyContain(userID: userID,
                                       lang: lang,
                                       countryCode: countryCode,
                                       limit: limit)
        case .getStickerCard(let userID, _):
            return getParamOnlyContainUserID(userID: userID)
        case .getRecentlyViewedPackages(let userID,
                                        let limit,
                                        let pageNumber):
            return getParamOnlyContain(userID: userID,
                                       limit: limit,
                                       pageNumber: pageNumber)
        case .viewStickerCategory:
            return .requestPlain
        case .registerStickerUsage(_, let userID, _, _, _):
            return getParamOnlyContainUserID(userID: userID)
        case .getRecentlyUsedStickers(let userID, let limit, let pageNumber):
            return getParamOnlyContain(userID: userID,
                                       limit: limit,
                                       pageNumber: pageNumber)
        case .getFrequentlyUsedStickers(let userID,
                                        let limit,
                                        let pageNumber):
            return getParamOnlyContain(userID: userID,
                                       limit: limit,
                                       pageNumber: pageNumber)
        case .getMyStickerPackageList(let userID,
                                      let limit,
                                      let pageNumber):
            return getParamOnlyContain(userID: userID,
                                       limit: limit,
                                       pageNumber: pageNumber)
        case .hideOrRecoverMySticker:
            return .requestPlain
        case .getHiddenStickersList(let userID,
                                    let limit,
                                    let pageNumber):
            return getParamOnlyContain(userID: userID,
                                       limit: limit,
                                       pageNumber: pageNumber)
        case .getStickerPackageWishList(let userID,
                                        let limit,
                                        let pageNumber):
            return getParamOnlyContain(userID: userID,
                                       limit: limit,
                                       pageNumber: pageNumber)
        case .addOrRemoveWishList(let userID, _):
            return getParamOnlyContain(userID: userID)
        case .getDownloadOrPurchaseHistory(let userID,
                                           let limit,
                                           let pageNumber):
            return getParamOnlyContain(userID: userID,
                                       limit: limit,
                                       pageNumber: pageNumber)
        case .sendGiftPackage,
             .confirmGiftPackage,
             .getSentGiftPackageList,
             .getReceivedGiftPackageList:
            return .requestPlain
        }
    }
    
    private func getParamOnlyContainUserID(userID: String) -> Task {
        let param: NSMutableDictionary = [:]
        param.addEntries(from: [APIParamKey.userID: userID])
        guard let p = param as? [String: Any] else {
            return .requestPlain
        }
        return .requestParameters(parameters: p, encoding: URLEncoding.queryString)
    }
    
    private func getParamOnlyContain(q: String? = nil,
                                     userID: String? = nil,
                                     isPurchase: String? = nil,
                                     lang: String? = nil,
                                     countryCode: String? = nil,
                                     limit: Int? = nil,
                                     pageNumber: Int? = nil,
                                     animated: String? = nil,
                                     price: String? = nil) -> Task {
        let param: NSMutableDictionary = [:]
        
        if let q = q { param.addEntries(from: [APIParamKey.q: q]) }
        if let userID = userID { param.addEntries(from: [APIParamKey.userID: userID]) }
        if let isPurchase = isPurchase { param.addEntries(from: [APIParamKey.isPurchase: isPurchase]) }
        if let lang = lang { param.addEntries(from: [APIParamKey.lang: lang]) }
        if let countryCode = countryCode { param.addEntries(from: [APIParamKey.countryCode: countryCode]) }
        if let limit = limit { param.addEntries(from: [APIParamKey.limit: limit]) }
        if let pageNumber = pageNumber { param.addEntries(from: [APIParamKey.pageNumber: pageNumber]) }
        if let animated = animated { param.addEntries(from: [APIParamKey.animated: animated]) }
        if let price = price { param.addEntries(from: [APIParamKey.price: price]) }
        
        guard let p = param as? [String: Any] else {
            return .requestPlain
        }
        return .requestParameters(parameters: p, encoding: URLEncoding.queryString)
    }

    // MARK: - Validation
    public var validationType: ValidationType {
        return .none
    }

    // MARK: - Sample Data
    public var sampleData: Data {
        return Data()
    }

    // MARK: - Headers
    public var headers: [String: String]? {
        let parameters = [APIParamKey.contentType: "application/json",
                          APIParamKey.lang: "en",
                          APIParamKey.apikey: Auth.getAPIKey()]
        return parameters
    }
}
