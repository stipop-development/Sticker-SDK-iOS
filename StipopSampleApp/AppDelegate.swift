//
//  AppDelegate.swift
//  StipopSampleApp
//
//  Created by Le Kim Tuan on 04/03/2021.
//

import UIKit
import STIPOP

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        STIPOP.setup(apiKey: "", needLogDebug: true)
        return true
    }

}

