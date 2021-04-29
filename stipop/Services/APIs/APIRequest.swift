//
//  APIRequest.swift
//  stipop
//
//  Created by Le Kim Tuan on 19/02/2021.

import Moya
import Alamofire
import UIKit

enum StipopStatusRequest: String, Codable {
    case success
    case fail
}

/**
 StipopErrorAPI
 
 - nonExistApikey: The API key used does not exist.
 - serverError: Unable to receive data from the server.
 */
enum StipopErrorAPI: String, Codable {
    case success = "0000"
    case nonExistApikey = "9000"
    case serverError = "1000"
}

enum StipopDescriptionErrorAPI: String {
    case success = "Success"
    case nonExistApikey = "The API key used does not exist."
    case serverError = "Unable to receive data from the server."
}

extension MoyaError {
    var underlyingError: Error {
        switch self {
        case .encodableMapping: return self
        case .imageMapping: return self
        case .jsonMapping: return self
        case .objectMapping: return self
        case .parameterEncoding: return self
        case .requestMapping: return self
        case .statusCode: return self
        case .stringMapping: return self
        case .underlying(let error, _): return error
        }
    }
}

class DefaultAlamofireManager: Alamofire.Session {
    static let sharedManager: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 5 // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = 20 // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return DefaultAlamofireManager(configuration: configuration)
    }()
}

private func JSONResponseDataFormatter(_ data: Data) -> String {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
    } catch {
        return String(data: data, encoding: .utf8) ?? ""
    }
}

private var apiProvider: MoyaProvider<APIs> {
    if Auth.getNeedLogDebug() {
        return MoyaProvider<APIs>(plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter),
                                                                                     logOptions: [.requestMethod,
                                                                                                  .requestHeaders,
                                                                                                  .requestBody,
                                                                                                  .formatRequestAscURL,
                                                                                                  .successResponseBody,
                                                                                                  .errorResponseBody]))])
    } else {
        return MoyaProvider<APIs>(plugins: [])
    }
}

class APIRequest {
    @discardableResult
    private static func request<T: Decodable>(targetAPI: APIs,
                                              completion: @escaping (Result<T, Error>) -> Void) -> Cancellable {
        let jsonDecoder = JSONDecoder()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        return apiProvider.request(targetAPI) { (moyaResult) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            let result: Swift.Result<T, Error>
            switch moyaResult {
            case .failure(let moyaError):
                result = Swift.Result<T, Error>.failure(moyaError.underlyingError)
            case .success(let moyaResponse):
                do {
                    let stipopObject: StipopResponse<T> = try moyaResponse.map(StipopResponse<T>.self,
                                                                               using: jsonDecoder,
                                                                               failsOnEmptyData: false)
                    if let objResult = stipopObject.body {
                        result = Swift.Result<T, Error>.success(objResult)
                    } else {
                        let error = self.responseObjectToError(responseObj: stipopObject)
                        result = Swift.Result<T, Error>.failure(error.underlyingError)
                        print(result)
                    }
                } catch let error {
                    guard let moyaError = error as? MoyaError else {
                        fatalError("Imposible case")
                    }
                    result = Swift.Result<T, Error>.failure(moyaError.underlyingError)
                    print(result)
                }
            }
            completion(result)
        }
    }
    
    @discardableResult
    private static func requestVoid(targetAPI: APIs, completionHandler: @escaping (Swift.Result<Void, Error>) -> Void) -> Cancellable {
        let jsonDecoder = JSONDecoder()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        return apiProvider.request(targetAPI) { moyaResult in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            let result: Swift.Result<Void, Error>
            switch moyaResult {
            case .success(let response):
                do {
                    let responseObject: ResponseVoid = try response.map(ResponseVoid.self, atKeyPath: nil, using: jsonDecoder, failsOnEmptyData: false)
                    if (200...299).contains(response.statusCode) {
                        result = Swift.Result<Void, Error>.success(())
                    } else {
                        let error = self.responseObjectToError(responseObj: responseObject)
                        result = Swift.Result<Void, Error>.failure(error.underlyingError)
                    }
                } catch let error {
                    guard let moyaError = error as? MoyaError else {
                        fatalError("Imposible case")
                    }
                    result = Swift.Result<Void, Error>.failure(moyaError.underlyingError)
                }
            case .failure(let error):
                result = Swift.Result<Void, Error>.failure(error.underlyingError)
            }
            completionHandler(result)
        }
    }
    
    private static func responseObjectToError(responseObj: ResponseVoid) -> MoyaError {
        var errorMsg = ""
        switch responseObj.header?.code {
        case .success:
            errorMsg = "Success"
        case .nonExistApikey:
            errorMsg = StipopDescriptionErrorAPI.nonExistApikey.rawValue
        case .serverError:
            errorMsg = StipopDescriptionErrorAPI.serverError.rawValue
        default:
            errorMsg = "Unknown error!!!"
        }
        let errorCode = Int(responseObj.header?.code.rawValue ?? "0000") ?? 0000
        let nsError = NSError(domain: "STIPOP-SDK-iOS",
                              code: errorCode,
                              userInfo: [NSLocalizedDescriptionKey: errorMsg])
        return MoyaError.underlying(nsError, nil)
    }
}

class ResponseVoid: Decodable {
    var header: Header?
    
    enum CodingKeys: String, CodingKey {
        case header
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        header = try container.decodeIfPresent(Header.self, forKey: .header)
    }
}

class DataError: Codable {
    
}

class StipopResponse<Result: Decodable>: ResponseVoid {
    let body: Result?
    
    private enum CodingKeys: String, CodingKey {
        case body
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        body = try container.decodeIfPresent(Result.self, forKey: .body)
        try super.init(from: decoder)
    }
}

public struct PageMap: Codable {
    let groupNumber: Int
    let totalCount: Int
    let endPage: Int
    let onePageCountRow: Int
    let modNum: Int
    let pageNumber: Int
    let startRow: Int
    let pageCount: Int
    let groupCount: Int
    let pageGroupCount: Int
    let startPage: Int
    let listStartNumber: Int
    let endRow: Int
    
    enum CodingKeys: String, CodingKey {
        case groupNumber, totalCount, endPage, onePageCountRow, modNum, pageNumber, startRow, pageCount, groupCount, pageGroupCount, startPage, listStartNumber, endRow
    }
}

public struct Header: Codable {
    let status: StipopStatusRequest
    let message: String
    let code: StipopErrorAPI
    
    private enum CodingKeys: String, CodingKey {
        case status, message, code
    }
}

extension APIRequest {
    static func searchStickers(q: String,
                               userID: String,
                               lang: String?,
                               countryCode: String?,
                               limit: Int?,
                               pageNumber: Int?,
                               completion: @escaping (Result<DataStipopStickerList, Error>) -> Void) {
        request(targetAPI: .searchStickers(q: q,
                                           userID: userID,
                                           lang: lang,
                                           countryCode: countryCode,
                                           limit: limit,
                                           pageNumber: pageNumber), completion: completion)
    }
    static func trendingSearchTerms(lang: String?,
                                    countryCode: String?,
                                    limit: Int?,
                                    completion: @escaping (Result<DataStipopKeywordList, Error>) -> Void) {
        request(targetAPI: .trendingSearchTerms(lang: lang,
                                                countryCode: countryCode,
                                                limit: limit), completion: completion)
    }
    static func searchRecent(userID: String,
                             completion: @escaping (Result<DataStipopKeywordList, Error>) -> Void) {
        request(targetAPI: .searchRecent(userID: userID),
                completion: completion)
    }
    static func getTopRankingStickerPackagesList(userID: String,
                                                 lang: String?,
                                                 countryCode: String?,
                                                 limit: Int?,
                                                 pageNumber: Int?,
                                                 animated: String?,
                                                 completion: @escaping (Result<DataStipopPackageList, Error>) -> Void) {
        request(targetAPI: .topRankingStickerPackagesList(userID: userID,
                                                          lang: lang,
                                                          countryCode: countryCode,
                                                          limit: limit,
                                                          pageNumber: pageNumber,
                                                          animated: animated), completion: completion)
    }
    static func getPackageStickerInfo(userID: String,
                                      packID: String,
                                      completion: @escaping (Result<DataPackageStipopSticker, Error>) -> Void) {
        request(targetAPI: .getPackageStickerInfo(userID: userID,
                                                  packID: packID), completion: completion)
    }
    static func downloadOrPurchaseSticker(packID: String,
                                          userId: String,
                                          isPurchase: String,
                                          lang: String?,
                                          countryCode: String?,
                                          price: String?,
                                          completion: @escaping (Result<Void, Error>) -> Void) {
        requestVoid(targetAPI: .downloadOrPurchaseSticker(packID: packID,
                                                      userId: userId,
                                                      isPurchase: isPurchase,
                                                      lang: lang,
                                                      countryCode: countryCode,
                                                      price: price), completionHandler: completion)
    }
    static func getNewStickerPackages(userID: String,
                                      lang: String?,
                                      countryCode: String?,
                                      limit: Int?,
                                      pageNumber: Int?,
                                      animated: String?,
                                      completion: @escaping (Result<DataStipopPackageList, Error>) -> Void) {
        request(targetAPI: .newStickerPackages(userID: userID,
                                               lang: lang,
                                               countryCode: countryCode,
                                               limit: limit,
                                               pageNumber: pageNumber,
                                               animated: animated), completion: completion)
    }
    static func getMainStickerBanners(userID: String,
                                      lang: String?,
                                      countryCode: String?,
                                      limit: Int?,
                                      completion: @escaping (Result<DataStipopBannerList, Error>) -> Void) {
        request(targetAPI: .getMainStickerBanners(userID: userID,
                                                  lang: lang,
                                                  countryCode: countryCode,
                                                  limit: limit), completion: completion)
    }
    static func getStickerCard(userID: String,
                               cardType: Int,
                               completion: @escaping (Result<DataStipopStickerCardList, Error>) -> Void) {
        request(targetAPI: .getStickerCard(userID: userID,
                                           cardType: cardType), completion: completion)
    }
    static func getRecentlyViewedPackages(userID: String,
                                          limit: Int?,
                                          pageNumber: Int?,
                                          completion: @escaping (Result<DataStipopPackageList, Error>) -> Void) {
        request(targetAPI: .getRecentlyViewedPackages(userID: userID,
                                                      limit: limit,
                                                      pageNumber: pageNumber), completion: completion)
    }
    static func viewStickerCategory(completion: @escaping (Result<DataStipopCategoryList, Error>) -> Void) {
        request(targetAPI: .viewStickerCategory, completion: completion)
    }
    static func registerStickerUsage(stickerID: Int,
                                     userID: String,
                                     q: String?,
                                     lang: String?,
                                     countryCode: String?,
                                     completion: @escaping (Result<Void, Error>) -> Void) {
        requestVoid(targetAPI: .registerStickerUsage(stickerID: stickerID,
                                                     userID: userID,
                                                     q: q,
                                                     lang: lang,
                                                     countryCode: countryCode), completionHandler: completion)
    }
    static func getRecentlyUsedStickers(userID: String,
                                        limit: Int?,
                                        pageNumber: Int?,
                                        completion: @escaping (Result<DataStipopStickerList, Error>) -> Void) {
        request(targetAPI: .getRecentlyUsedStickers(userID: userID,
                                                    limit: limit,
                                                    pageNumber: pageNumber), completion: completion)
    }
    static func getFrequentlyUsedStickers(userID: String,
                                          limit: Int?,
                                          pageNumber: Int?,
                                          completion: @escaping (Result<DataStipopStickerList, Error>) -> Void) {
        request(targetAPI: .getFrequentlyUsedStickers(userID: userID,
                                                      limit: limit,
                                                      pageNumber: pageNumber), completion: completion)
    }
    static func getMyStickerPackageList(userID: String,
                                        limit: Int?,
                                        pageNumber: Int?,
                                        completion: @escaping (Result<DataStipopPackageList, Error>) -> Void) {
        request(targetAPI: .getMyStickerPackageList(userID: userID,
                                                    limit: limit,
                                                    pageNumber: pageNumber), completion: completion)
    }
    static func hideOrRecoverMySticker(userID: String,
                                       packID: Int,
                                       completion: @escaping (Result<Void, Error>) -> Void) {
        requestVoid(targetAPI: .hideOrRecoverMySticker(userID: userID,
                                                       packID: packID), completionHandler: completion)
    }
    static func getHiddenStickersList(userID: String,
                                      limit: Int?,
                                      pageNumber: Int?,
                                      completion: @escaping (Result<DataStipopPackageList, Error>) -> Void) {
        request(targetAPI: .getHiddenStickersList(userID: userID,
                                                  limit: limit,
                                                  pageNumber: pageNumber), completion: completion)
    }
    static func getStickerPackageWishList(userID: String,
                                          limit: Int?,
                                          pageNumber: Int?,
                                          completion: @escaping (Result<DataStipopPackageList, Error>) -> Void) {
        request(targetAPI: .getStickerPackageWishList(userID: userID,
                                                      limit: limit,
                                                      pageNumber: pageNumber), completion: completion)
    }
    static func addOrRemoveWishList(userID: String,
                                    packID: Int,
                                    completion: @escaping (Result<Void, Error>) -> Void) {
        requestVoid(targetAPI: .addOrRemoveWishList(userID: userID,
                                                    packID: packID), completionHandler: completion)
    }
    static func getDownloadOrPurchaseStickerHistory(userID: String,
                                                    limit: Int?,
                                                    pageNumber: Int?,
                                                    completion: @escaping (Result<DataStipopPackageList, Error>) -> Void) {
        request(targetAPI: .getDownloadOrPurchaseHistory(userID: userID,
                                                         limit: limit,
                                                         pageNumber: pageNumber), completion: completion)
    }
    static func sendGiftPackage(packID: Int,
                                sendUserID: String,
                                receiveUserID: String,
                                completion: @escaping (Result<Void, Error>) -> Void) {
        requestVoid(targetAPI: .sendGiftPackage(packID: packID,
                                                sendUserID: sendUserID,
                                                receiveUserID: receiveUserID), completionHandler: completion)
    }
    static func confirmGiftPackage(packID: Int,
                                   sendUserID: String,
                                   receiveUserID: String,
                                   completion: @escaping (Result<Void, Error>) -> Void) {
        requestVoid(targetAPI: .confirmGiftPackage(packID: packID,
                                                   sendUserID: sendUserID,
                                                   receiveUserID: receiveUserID), completionHandler: completion)
    }
    static func getSentGiftPackageList(userID: String,
                                       limit: Int?,
                                       pageNumber: Int?,
                                       completion: @escaping (Result<DataStipopPackageList, Error>) -> Void) {
        request(targetAPI: .getSentGiftPackageList(userID: userID,
                                                   limit: limit,
                                                   pageNumber: pageNumber), completion: completion)
    }
    
    static func getReceivedGiftPackageList(userID: String,
                                           limit: Int?,
                                           pageNumber: Int?,
                                           completion: @escaping (Result<DataStipopPackageList, Error>) -> Void) {
        request(targetAPI: .getReceivedGiftPackageList(userID: userID,
                                                       limit: limit,
                                                       pageNumber: pageNumber), completion: completion)
    }
}
