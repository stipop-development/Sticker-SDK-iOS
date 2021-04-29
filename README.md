![STIPOP](https://t1.daumcdn.net/thumb/R720x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/amrN/image/BuKqcTCeODXYMuFjT6UukiZAziw.JPG)

# Stipop iOS SDK
Stipop SDK powers over 270,000 stickers(+animated) that can be integrated to chat, camera, video call, and profile interfaces. Get access to world's no.1 sticker platform and boost user engagement. 

## Requirement
- Xcode >= 12.3
- Carthage >= 0.37.0
- Swift 5

## Installation
### Carthage
```
github "stipop-development/Stipop-SDK-iOS" ~> 0.0.1
```
Paste this code to `Cartfile` and run
```
carthage update --use-xcframeworks --platform iOS
```

### CocoaPods
Cocoapods will be available soon.

## API Key
Sign up on [Stipop Dashboard](https://dashboard.stipop.io/auth/sign-up) for free and create your application to get unique API key.
If you have any questions, please [contact us](https://stipop.io/contact-us). 

## How to use
### Setup your API Key
To start developing, you should sign up on [Stipop Dashboard](https://dashboard.stipop.io/auth/sign-up) and generate your own API Key. Then paste it at `AppDelegate.swift` like this.
```Swift
import UIKit
import STIPOP

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        STIPOP.setup(apiKey: "your_own_api_key", needLogDebug: true)
        return true
    }

}
```
After that, You can import STIPOP successfully on your XCode Project.
```Swift
import STIPOP
```

### More guide
You can see more on what endpoint features are provided through the SDK on [Stipop Docs](https://docs.stipop.io/).
You can also find guide to api key generation, quick start guide, guide to UI kit on Docs as well.
