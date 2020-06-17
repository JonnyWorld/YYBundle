#
# Be sure to run `pod lib lint YYBundle.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YYBundle'
  s.version          = '1.1.0'
  s.summary          = 'YYBundle. used for launch App'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  1.为Appdelegates瘦身
  2.启动组件化
                       DESC

  s.homepage         = 'https://github.com/baozhoua/YYBundle'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'baozhou' => 'baozhoua@163.com' }
  s.source           = { :git => 'https://github.com/baozhoua/YYBundle.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YYBundle/Classes/YYBundleHeader.h'
  
  # s.resource_bundles = {
  #   'YYBundle' => ['YYBundle/Assets/*.png']
  # }

   s.public_header_files = 'YYBundle/YYBundleHeader.h'

   s.subspec 'BundleInterface' do |interface|
       interface.source_files = 'YYBundle/Classes/BundleInterface/*.{h,m}'
    end
   
   s.subspec 'BundleManager' do |manager|
       manager.source_files = 'YYBundle/Classes/BundleManager/*.{h,m}'
       manager.dependency 'YYBundle/BundleInterface'
    end

   
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
