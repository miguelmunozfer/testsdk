require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = 'vitale-sdk-react-native'
  s.version      = package['version']
  s.summary      = package['description']
  s.homepage     = package['homepage']
  s.license      = package['license']
  s.authors      = package['author']
  
  s.platforms    = { :ios => "12.0" }
  s.source       = { :git => "https://github.com/miguelmunozfer/testsdk", :branch => "main" }
  
  s.source_files = "ios/VitaleSDKBridge/**/*.{h,m,mm,swift}"
  s.requires_arc = true
  
  s.dependency "React-Core"
  s.dependency 'VitaleHealthSDK', :git => 'https://github.com/miguelmunozfer/VitaleSPM'
  
  s.swift_version = '5.0'
  s.pod_target_xcconfig = { 
    'DEFINES_MODULE' => 'YES'
  }
end 