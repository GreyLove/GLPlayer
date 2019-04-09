#
# Be sure to run `pod lib lint GLPlayer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GLPlayer'
  s.version          = '0.1.0'
  s.summary          = 'A short description of GLPlayer.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  支持音频、视频播放（暂时是本地播放，后续更新在线播放、边下载边播放....）
                       DESC

  s.homepage         = 'https://github.com/guolei/GLPlayer'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'guolei' => '1059395623@qq.com' }
  s.source           = { :git => 'https://github.com/guolei/GLPlayer.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'GLPlayer/Classes/**/*'

  s.vendored_libraries = 'GLPlayer/Classes/**/*.a'
  # s.resource_bundles = {
  #   'GLPlayer' => ['GLPlayer/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
