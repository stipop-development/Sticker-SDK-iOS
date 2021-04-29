Pod::Spec.new do |spec|
  spec.platform                 = :ios
  spec.ios.deployment_target    = '10.0'
  spec.name                     = 'STIPOP'
  spec.version                  = '1.0.0'
  spec.homepage                 = 'https://github.com/stipop-development/Stipop-SDK-iOS'
  spec.authors                  = { 'Bien Do' => 'biendodinh@gmail.com' }
  spec.summary                  = 'SDK for request APIs of Stipop.'
  spec.source                   = { :git => 'https://github.com/stipop-development/Stipop-SDK-iOS.git', :branch => "main" }
  spec.source_files             = 'Stipop/**/*.{swift,h,m}'
  spec.resources                = 'Stipop/**/*.{lproj,storyboard,xcdatamodeld,xib,xcassets,json}'
  spec.requires_arc             = true
  spec.framework                = "UIKit"

  # spec.vendored_frameworks = 'EFCSDK.xcframework'
  spec.dependency 'Moya', '14.0.1'
end
