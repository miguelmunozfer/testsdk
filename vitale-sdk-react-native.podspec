require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = 'vitale-sdk-react-native'
  s.version      = package['version']
  s.summary      = package['description']
  s.homepage     = package['homepage']
  s.license      = package['license']
  s.authors      = package['author']
  
  s.platform     = :ios, "15.0"
  s.source       = { :git => "https://github.com/miguelmunozfer/testsdk", :tag => "#{s.version}" }
  
  s.source_files = "ios/**/*.{h,m,mm,swift}"
  s.requires_arc = true
  
  s.dependency "React-Core"
  s.dependency "VitaleHealthSDK"  # Si es necesario
end 