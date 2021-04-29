//
//  ViewController.swift
//  StipopSampleApp
//
//  Created by Le Kim Tuan on 04/03/2021.
//

import UIKit
import STIPOP

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //        STIPOP.getTopRankingStickerPackagesList(userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c", pageNumber: 1, date: nil, animated: nil, country: nil, searchText: nil) { (result) in
        //            switch result {
        //            case .success(let data):
        //                print(data.packageList.map({ $0.packageName }))
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            }
        //        }
        //
        //        STIPOP.getPackageStickerInfo(userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c", packageID: "6337", country: "us") { (result) in
        //            switch result {
        //            case .success(let data):
        //                print(data.package.artistName)
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            }
        //        }
                
        //        STIPOP.getRecentlyViewedPackages(userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c") { (result) in
        //            switch result {
        //            case .success(let data):
        //                print(data.packageList.map({ $0.artistName }))
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            }
        //        }
                
        //        STIPOP.getRecentlyUsedStickers(userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c") { (result) in
        //            switch result {
        //            case .success(let data):
        //                print(data.stickerList.map({ $0.stickerImg }))
        //            case .failure(let error):
        //                print(error)
        //            }
        //        }
                
        //        STIPOP.getFrequentlyUsedStickers(userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c") { (result) in
        //            switch result {
        //            case .success(let data):
        //                print(data.stickerList.map( {$0.stickerImg} ))
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            }
        //        }
                
        //        STIPOP.searchStickers(userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c", searchText: "cute", pageNumber: 1) { (result) in
        //            switch result {
        //            case .success(let data):
        //                print(data.stickerList.map({ $0.keyword }))
        //                print(data.pageMap)
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            }
        //        }
                
        //        STIPOP.searchSuggestion { (result) in
        //            switch result {
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            case .success(let data):
        //                print(data.keywordList)
        //            }
        //        }
                
        //        STIPOP.searchRecent(userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c") { (result) in
        //            switch result {
        //            case .success(let data):
        //                print(data.keywordList.map({ $0.keyword }))
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            }
        //        }
                
        //        STIPOP.getNewStickerPackages(userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c") { (result) in
        //            switch result {
        //            case .success(let data):
        //                print(data.packageList.map({ $0.artistName }))
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            }
        //        }
                
        //        STIPOP.getMainStickerBanners(userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c") { (result) in
        //            switch result {
        //            case .success(let data):
        //                print(data.bannerList.map({ $0.bannerImg }))
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            }
        //        }
                
        //        STIPOP.getStickerCards(userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c", cardType: 2) { (result) in
        //            switch result {
        //            case .success(let data):
        //                print(data.cardInfo.cardTitle)
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            }
        //        }
                
        //        STIPOP.downloadOrPurchaseStickers(userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c", packageId: 6337, price: "0", country: "en") { (result) in
        //            print(result)
        //        }
                
        //        STIPOP.getDownloadOrPurchaseStickersHistory(userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c") { (result) in
        //            switch result {
        //            case .success(let data):
        //                print(data.packageList)
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            }
        //        }
                
        //        STIPOP.getStickerPackageWishList(userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c") { (result) in
        //            switch result {
        //            case .success(let data):
        //                print(data.packageList)
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            }
        //        }
                
        //        STIPOP.addOrRemoveWishList(userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c", packageId: 6310) { (result) in
        //            switch result {
        //            case .success:
        //                print("Success")
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            }
        //        }
                
        //        STIPOP.getMyStickerPackageList(userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c") { (result) in
        //            print(result)
        //        }
                
        //        STIPOP.hideOrRecoverMySticker(userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c", packageId: 6335) { (result) in
        //            print(result)
        //        }
        //
        //        STIPOP.getHiddenStickersList(userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c") { (result) in
        //            print(result)
        //        }
                
        //        STIPOP.registerStickerUsage(stickerID: 140268, userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c") { (result) in
        //            print(result)
        //        }
                
        //        STIPOP.viewStickerCategory { (result) in
        //            switch result {
        //            case .success(let data):
        //                print(data.categoryList.map({ $0.category }))
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            }
        //        }
                
        //        STIPOP.sendGiftPackage(packageID: 6335, sendUserID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c", receiveUserID: "1706ef82-09f7-4bdd-9d97-flllef70db6l") { (result) in
        //            print(result)
        //        }
                
        //        STIPOP.confirmGiftPackage(packageID: 6335, sendUserID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c", receiveUserID: "1706ef82-09f7-4bdd-9d97-flllef70db6l") { (result) in
        //            print(result)
        //        }
                
        //        STIPOP.getSentGiftPackageList(userID: "1706ef82-09f7-4bdd-9d97-fcccef70db6c") { (result) in
        //            print(result)
        //        }
                
                STIPOP.getReceivedGiftPackageList(userID: "1706ef82-09f7-4bdd-9d97-flllef70db6l") { (result) in
                    print(result)
                }
    }


}

