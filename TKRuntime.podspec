#
# Be sure to run `pod lib lint TKRuntime.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TKRuntime'
  s.version          = '0.1.0'
  s.summary          = 'NSObject extension with NSObjCRuntime.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'NSObject extension with NSObjCRuntime, We can edit class at runloop'

  s.homepage         = 'https://github.com/ZhengXianda0512/TKRuntime'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhengxianda' => 'zhengxianda0512@gmail.com' }
  s.source           = { :git => 'https://github.com/zhengxianda/TKRuntime.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.source_files = 'TKRuntime/Classes/**/*'

  s.prefix_header_contents = '#import "TKEncoding.h"'

  # s.resource_bundles = {
  #   'TKRuntime' => ['TKRuntime/Assets/*.png']
  # }

  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
