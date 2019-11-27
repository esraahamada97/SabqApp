# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'SabqApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
# ignore all warnings from all pods
inhibit_all_warnings!

  # Pods for SabqApp
 pod 'Moya'
 pod 'SDWebImage'
pod 'SwiftLint'
pod 'DateToolsSwift'
 pod 'Windless'
pod 'GoogleSignIn'
pod 'FittedSheets'
pod ‘TwitterKit’
pod 'Firebase/Auth'
pod 'FBSDKCoreKit'
pod 'FBSDKLoginKit'
pod 'Firebase/Core' 
pod 'Firebase/Firestore'
pod 'Firebase/Storage'




post_install do |installer|
  installer.pods_project.targets.each do |target|
    if ['FittedSheets','Moya'].include? target.name
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.2'
      end
    end
    
    if ['Windless'].include? target.name
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.0'
      end
    end
    
  end
end

end
