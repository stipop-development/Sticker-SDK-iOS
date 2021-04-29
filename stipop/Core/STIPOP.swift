//
//  STIPOP.swift
//  Stipop
//
//  Created by Le Kim Tuan on 25/02/2021.
//

import UIKit

@objc public final class STIPOP: NSObject {
    /**
     Set-up apiKey and appId
     
     - apiKey: API key of Stipop.
     - needLogDebug: Enabled log debug API.
     */
    public static func setup(apiKey: String, needLogDebug: Bool) {
        Auth.setup(apiKey: apiKey, needLogDebug: needLogDebug)
    }
    
    // MARK: - 여기
    /**
     The Sticker Search API let's users search for stickers based on emotional and situational tags. It's handy to have the search UI near where users send or use stickers like on the keyboard section. You can also have the search within the sticker store so users can search for specific stickers that they want to download. Each search result will have in default 100 sticker results at maximum.
     
     - userId: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - searchText: Search tag.
     - pageNumber: Page number.
     - returns: Result<DataStipopStickerList, Error>) result.
     */
    public static func searchStickers(q: String,
                                      userID: String,
                                      lang: String? = nil,
                                      countryCode: String? = nil,
                                      limit: Int? = nil,
                                      pageNumber: Int? = nil,
                                      completion: @escaping (Result<DataStipopStickerList, Error>) -> Void) {
        APIRequest.searchStickers(q: q,
                                  userID: userID,
                                  lang: lang,
                                  countryCode: countryCode,
                                  limit: limit,
                                  pageNumber: pageNumber,
                                  completion: completion)
    }
    
    
    /**
     The Trending Search Terms API shows search tag suggestions based on trendy searches by other users. It's essential to use it along with the sticker search API. 20 tag suggestions are provided through this API.
     
     - returns: Result<DataStipopKeywordList, Error>) result.
     */
    public static func trendingSearchTerms(lang: String? = nil,
                                           countryCode: String? = nil,
                                           limit: Int? = nil,
                                           completion: @escaping (Result<DataStipopKeywordList, Error>) -> Void) {
        APIRequest.trendingSearchTerms(lang: lang,
                                       countryCode: countryCode,
                                       limit: limit,
                                       completion: completion)
    }
    
    
    /**
     The Recent Search API shows recent search tags by user. It's essential to use it along with the sticker search API. 12 recent search tags are provided through this API.
     
     - userId: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - returns: Result<DataStipopKeywordList, Error>) result.
     */
    public static func searchRecent(userID: String,
                                    completion: @escaping (Result<DataStipopKeywordList, Error>) -> Void) {
        APIRequest.searchRecent(userID: userID,
                                completion: completion)
    }
    
    
    /**
     The Package Ranking List API delivers top ranking sticker packages based on the data sets from millions of sticker downloads in Stipop platform. This is the most basic endpoint to show a list of sticker packages to users.
     
     - userId: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - pageNumber: Page number.
     - date: Ranking period. Ex: Daily, Weekly, Monthly. Empty parameter: Total period.
     - category: Show results only for category chosen from the Category Endpoint API.
     - animated: Y: Look for animated sticker ranking. N: Look for static(still) sticker ranking Empty parameter: Look for all stickers.
     - country: Two letter code for selecing country in ranking. Ex: en, ko, es.
     - searchText: Search keyword.
     - returns: Result<DataStipopPackageList, Error>) result.
     */
    public static func getTopRankingStickerPackagesList(userID: String,
                                                        lang: String? = nil,
                                                        countryCode: String? = nil,
                                                        limit: Int? = nil,
                                                        pageNumber: Int? = nil,
                                                        animated: String? = nil,
                                                        completion: @escaping (Result<DataStipopPackageList, Error>) -> Void) {
        APIRequest.getTopRankingStickerPackagesList(userID: userID,
                                                    lang: lang,
                                                    countryCode: countryCode,
                                                    limit: limit,
                                                    pageNumber: pageNumber,
                                                    animated: animated,
                                                    completion: completion)
    }
    
    
    /**
     The Package Sticker Info API contains all the sticker images and package information you need to display a sticker package page. It is importnat that sticker artist’s name is displayed on this page to prevent any copyright issues.
     
     - userId: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - packageId: Unique value for each sticker packages.
     - country: Two letter code for selecing country in ranking. Ex: en, ko, es.
     - returns: Result<DataPackageStipopSticker, Error>) result.
     */
    public static func getPackageStickerInfo(userID: String,
                                             packID: String,
                                             completion: @escaping (Result<DataPackageStipopSticker, Error>) -> Void) {
        APIRequest.getPackageStickerInfo(userID: userID,
                                         packID: packID,
                                         completion: completion)
    }
    
    
    /**
     Users can download a sticker package to send it’s stickers on your messaging platform. Use the Download/Purchase Sticker API to activate sticker downloads and purchases. The default setting in your Dashboard is set to have the API used for sticker free downloads for users. You can follow these steps and start selling sticker packages on your platform and generate a new source of revenue. Many of our partners have utilized sticker stores in their app using our optimized UI Kit for Sticker Download/Purchase.
     
     - userId: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - packageId: Unique value for each sticker packages.
     - price: Price set by the services.
     - country: Two letter code for selecing country in ranking. Ex: en, ko, es
     - returns: Result<Void, Error>) result.
     */
    public static func downloadOrPurchaseStickers(packID: String,
                                                  userId: String,
                                                  isPurchase: String,
                                                  lang: String? = nil,
                                                  countryCode: String? = nil,
                                                  price: String? = nil,
                                                  completion: @escaping (Result<Void, Error>) -> Void) {
        APIRequest.downloadOrPurchaseSticker(packID: packID,
                                             userId: userId,
                                             isPurchase: isPurchase,
                                             lang: lang,
                                             countryCode : countryCode,
                                             price: price,
                                             completion: completion)
    }
    
    
    /**
     The New Sticker Packages API delivers new sticker packages uploaded by sticker artists in Stipop platform. This is one of the most basic endpoint to show a list of sticker packages to users.
     
     - userId: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - returns: Result<DataStipopPackageList, Error>) result.
     */
    public static func getNewStickerPackages(userID: String,
                                             lang: String? = nil,
                                             countryCode: String? = nil,
                                             limit: Int? = nil,
                                             pageNumber: Int? = nil,
                                             animated: String? = nil,
                                             completion: @escaping (Result<DataStipopPackageList, Error>) -> Void) {
        APIRequest.getNewStickerPackages(userID: userID,
                                         lang: lang,
                                         countryCode: countryCode,
                                         limit: limit,
                                         pageNumber: pageNumber,
                                         animated: animated,
                                         completion: completion)
    }
    
    
    /**
     With the Main Banner API, you can show attractive sticker banners to users. All stickers and main image of the banner are all personally curated by Stipop content team. Just by adding the main banner you can drastically increase sticker download rate. Along with the banner, try using sticker cards below to build a whole new sticker feed.
     
     - userId: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - returns: Result<DataStipopBannerList, Error>) result.
     */
    public static func getMainStickerBanners(userID: String,
                                             lang: String? = nil,
                                             countryCode: String? = nil,
                                             limit: Int? = nil,
                                             completion: @escaping (Result<DataStipopBannerList, Error>) -> Void) {
        APIRequest.getMainStickerBanners(userID: userID,
                                         lang: lang,
                                         countryCode: countryCode,
                                         limit: limit,
                                         completion: completion)
    }
    
    
    /**
     Use the following Sticker Card APIs to create a unique sticker feed. Each sticker cards are curated by Stipop content team on a weekly basis. It will make the sticker discovery experience rich and fun for the users.
     
     - userId: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - returns: Result<DataStipopStickerCardList, Error>) result.
     */
    public static func getStickerCards(userID: String,
                                       cardType: Int,
                                       completion: @escaping (Result<DataStipopStickerCardList, Error>) -> Void) {
        APIRequest.getStickerCard(userID: userID,
                                  cardType: cardType,
                                  completion: completion)
    }
    
    
    /**
     The Recently Viewed Packages API gives the list of sticker packages which a user has viewed recently. You can use this API to show a list of recently viewed sticker packages. This will help increase the download/purchaserate.
     
     - userId: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - returns: Result<DataStipopPackageList, Error>) result.
     */
    public static func getRecentlyViewedPackages(userID: String,
                                                 limit: Int? = nil,
                                                 pageNumber: Int? = nil,
                                                 completion: @escaping (Result<DataStipopPackageList, Error>) -> Void) {
        APIRequest.getRecentlyViewedPackages(userID: userID,
                                             limit: limit,
                                             pageNumber: pageNumber,
                                             completion: completion)
    }
    
    
    /**
     Use the View Sticker Category API to get a list of all the sticker categories used in Stipop Sticker Library.
     
     - returns: Result<DataStipopCategoryList, Error>) result.
     */
    public static func viewStickerCategory(completion: @escaping (Result<DataStipopCategoryList, Error>) -> Void) {
        APIRequest.viewStickerCategory(completion: completion)
    }
    
    
    /**
     Knowing that understanding user behavior in a product is crutial, we’ve also built an analyzing tool that lets you understand what’s going on in your product. By simply Registering Sticker Usage you’ll be able to track all sticker usage and view them on your Dashboard.

     By seeing which stickers are being used on your platform you can get insights in user engagement and see theirempathetic data will help you understand your users better. Plus, we will be able to target specific users when selling a sticker package which will increase revenue income on your platform as well.
     
     - stickerId: Unique value for a single sticker.
     - userId: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - returns: Result<Void, Error>) result.
     */
    public static func registerStickerUsage(stickerID: Int,
                                            userID: String,
                                            q: String? = nil,
                                            lang: String? = nil,
                                            countryCode: String? = nil,
                                            completion: @escaping (Result<Void, Error>) -> Void) {
        APIRequest.registerStickerUsage(stickerID: stickerID,
                                        userID: userID,
                                        q: q,
                                        lang: lang,
                                        countryCode: countryCode,
                                        completion: completion)
    }
    
    
    /**
     The Recently Used Stickers API gives the list of stickers which a user has used (or sent on a messenger to be more precise) recently. You can use this API to show a list of recently used stickers on the Keyboard UI where you show other sticker packages users can send. It will drastically enhance user experience for users as showing a group of recently used stickers to users makes it a lot easier to them when sending stickers.
     
     - userId: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - returns: Result<DataStipopStickerList, Error>) result.
     */
    public static func getRecentlyUsedStickers(userID: String,
                                               limit: Int? = nil,
                                               pageNumber: Int? = nil,
                                               completion: @escaping (Result<DataStipopStickerList, Error>) -> Void) {
        APIRequest.getRecentlyUsedStickers(userID: userID,
                                           limit: limit,
                                           pageNumber: pageNumber,
                                           completion: completion)
    }
    
    
    /**
     The Frequently Used Stickers API gives the list of stickers which a user has used the most (or sent the most on a messenger). You can use this API to show a list of frequently used stickers on the Keyboard UI where you show other sticker packages users can send. It will drastically enhance user experience for users as showing a group of recently used stickers to users makes it a lot easier to them when sending stickers.
     
     - userId: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - returns: Result<DataStipopStickerList, Error>) result.
     */
    public static func getFrequentlyUsedStickers(userID: String,
                                                 limit: Int? = nil,
                                                 pageNumber: Int? = nil,
                                                 completion: @escaping (Result<DataStipopStickerList, Error>) -> Void) {
        APIRequest.getFrequentlyUsedStickers(userID: userID,
                                             limit: limit,
                                             pageNumber: pageNumber,
                                             completion: completion)
    }
    
    
    /**
     The My Sticker Package List API gives the list of stickers which a user has downloaded or purchased. You can use this API to show a list of downloaded/purchased stickers in the My Page UI. It is an essential feature to the users. Download history automatically changes to Purchase history when you change your pricing status in your Dashboard.
     
     - userId: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - returns: Result<DataStipopPackageList, Error>) result.
     */
    public static func getMyStickerPackageList(userID: String,
                                               limit: Int? = nil,
                                               pageNumber: Int? = nil,
                                               completion: @escaping (Result<DataStipopPackageList, Error>) -> Void) {
        APIRequest.getMyStickerPackageList(userID: userID,
                                           limit: limit,
                                           pageNumber: pageNumber,
                                           completion: completion)
    }
    
    
    /**
     The Hide/Recover My Sticker API allows for the user to hide or recover any sticker packages from the user’s my sticker list. This API can be used within the edit feature of my sticker list. In the case of free stickers ‘Hide’ feature can be used as a ‘Delete’ function, but for a purchased sticker the sticker can only be ‘Hidden’ from my stickers list and later be restored without any additional purchase.
     
     - userId: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - packageId: Unique value for each sticker packages.
     - returns: Result<Void, Error>) result.
     */
    public static func hideOrRecoverMySticker(userID: String,
                                              packID: Int,
                                              completion: @escaping (Result<Void, Error>) -> Void) {
        APIRequest.hideOrRecoverMySticker(userID: userID,
                                          packID: packID,
                                          completion: completion)
    }
    
    
    /**
     The List of Hidden Stickers API gives the list of stickers which a user has hidden (or deleted in case of free stickers) from the user’s my stickers list. You can use this API to show a list of hidden (deleted) stickers in the My Page UI. It is an essential feature to the users. In general, once users have more than 10 stickers they decide to hide some of their stickers so they can use what they prefer much easily.
     
     - userId: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - returns: Result<DataStipopPackageList, Error>) result.
     */
    public static func getHiddenStickersList(userID: String,
                                             limit: Int? = nil,
                                             pageNumber: Int? = nil,
                                             completion: @escaping (Result<DataStipopPackageList, Error>) -> Void) {
        APIRequest.getHiddenStickersList(userID: userID,
                                         limit: limit,
                                         pageNumber: pageNumber,
                                         completion: completion)
    }
    
    
    /**
     The Sticker Package Wish List API gives the list of stickers which a user has added into their wish list using the Add/Remove Wish List API. You can use this API to show user’s sticker package wish list in the My Page UI. It is an essential feature to the users. Users can choose to add any sticker packages into the wish list and also remove sticker packages from the wish list too.
     
     - userId: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - returns: Result<DataStipopPackageList, Error>) result.
     */
    public static func getStickerPackageWishList(userID: String,
                                                 limit: Int? = nil,
                                                 pageNumber: Int? = nil,
                                                 completion: @escaping (Result<DataStipopPackageList, Error>) -> Void) {
        APIRequest.getStickerPackageWishList(userID: userID,
                                             limit: limit,
                                             pageNumber: pageNumber,
                                             completion: completion)
    }
    
    
    /**
     The Add/Remove Wish List API allows for the user to add or remove any sticker packages from the user’s sticker package wish list. This API can be used with ‘Like’ icon or ‘Add to Wish List’ button in the My Page & Sticker Page UI. In the case of free stickers it can be simply used as ‘Like’ feature, and in the case of sticker store it can be a wish list for a potential sticker purchase.
     
     - userId: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - packageId: Unique value for each sticker packages.
     - returns: Result<Void, Error>) result.
     */
    public static func addOrRemoveWishList(userID: String,
                                           packID: Int,
                                           completion: @escaping (Result<Void, Error>) -> Void) {
        APIRequest.addOrRemoveWishList(userID: userID,
                                       packID: packID,
                                       completion: completion)
    }
    
    
    /**
     The Download/Purchase History API gives the list of stickers which a user has downloaded or purchased. You can use this API to show a list of downloaded/purchased stickers in the My Page UI. It is an essential feature to the users. Download history automatically changes to Purchase history when you change your pricing status in your Dashboard. To learn more about how to alter from free sticker library model into a paid sticker store, click here.
     
     - userId: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - returns: Result<DataStipopPackageList, Error>) result.
     */
    public static func getDownloadOrPurchaseStickersHistory(userID: String,
                                                            limit: Int? = nil,
                                                            pageNumber: Int? = nil,
                                                            completion: @escaping (Result<DataStipopPackageList, Error>) -> Void) {
        APIRequest.getDownloadOrPurchaseStickerHistory(userID: userID,
                                                       limit: limit,
                                                       pageNumber: pageNumber,
                                                       completion: completion)
    }
    
    
    /**
     Once sticker store is all set, you can start adding more advanced features like Sending a Gift Sticker Package, between users. A lot of the users purchase stickers to send it as a gift to another user. With this API, any user can send a gift sticker package to another user in your platform. The receiver then Confirms Gift Package and then can start using the sticker package.
     
     - packageID: Unique value for a sticker package.
     - sendUserID: Unique ID for a user sending the gift package.
     - receiveUserID: Unique ID for a user receiving the gift package.
     - returns: Result<Void, Error>) result.
     */
    public static func sendGiftPackage(packID: Int,
                                       sendUserID: String,
                                       receiveUserID: String,
                                       completion: @escaping (Result<Void, Error>) -> Void) {
        APIRequest.sendGiftPackage(packID: packID,
                                   sendUserID: sendUserID,
                                   receiveUserID: receiveUserID,
                                   completion: completion)
    }
    
    
    /**
     Add the Confirm Gift Package API along with Send Gift Package API. Once these are added you can also add a list of sent/received sticker packages so the users can see a list of gifted sticker packages.
     
     - packageID: Unique value for a sticker package.
     - sendUserID: Unique ID for a user sending the gift package.
     - receiveUserID: Unique ID for a user receiving the gift package.
     - returns: Result<Void, Error>) result.
     */
    public static func confirmGiftPackage(packID: Int,
                                          sendUserID: String,
                                          receiveUserID: String,
                                          completion: @escaping (Result<Void, Error>) -> Void) {
        APIRequest.confirmGiftPackage(packID: packID,
                                      sendUserID: sendUserID,
                                      receiveUserID: receiveUserID,
                                      completion: completion)
    }
    
    
    /**
     The Sent Gift Package List API delivers a list of stickers that a user has received from another user as a gift.
     
     - userID: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - returns: Result<DataStipopPackageList, Error>) result.
     */
    public static func getSentGiftPackageList(userID: String,
                                              limit: Int? = nil,
                                              pageNumber: Int? = nil,
                                              completion: @escaping (Result<DataStipopPackageList, Error>) -> Void) {
        APIRequest.getSentGiftPackageList(userID: userID,
                                          limit: limit,
                                          pageNumber: pageNumber,
                                          completion: completion)
    }
    
    
    /**
     The Received Gift Package List API delivers a list of stickers that a user has received from another user as a gift.
     
     - userID: Unique ID you use to distinguish each users. Can be in any format you use in your service.
     - returns: Result<DataStipopPackageList, Error>) result.
     */
    public static func getReceivedGiftPackageList(userID: String,
                                                  limit: Int? = nil,
                                                  pageNumber: Int? = nil,
                                                  completion: @escaping (Result<DataStipopPackageList, Error>) -> Void) {
        APIRequest.getReceivedGiftPackageList(userID: userID,
                                              limit: limit,
                                              pageNumber: pageNumber,
                                              completion: completion)
    }
}
