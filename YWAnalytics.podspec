#
# Be sure to run `pod lib lint YWAnalytics.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YWAnalytics'
  s.version          = '0.1.0'
  s.summary          = 'YWAnalytics'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/yezi-kk/YWAnalytics'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ye Wei' => '276208561@qq.com' }
  s.source           = { :git => 'https://github.com/yezi-kk/YWAnalytics.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'YWAnalytics/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'UMengAnalytics-NO-IDFA', '~> 4.2.5'
  s.dependency 'Aspects', '~> 1.4.1'
  s.dependency 'XAspect', '~> 1.0.5'
  s.dependency 'YWAppDelegate', '~> 0.1.0'
end
