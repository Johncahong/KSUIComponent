#
# Be sure to run `pod lib lint KSUIComponent.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KSUIComponent'
  s.version          = '0.1.0'
  s.summary          = 'A short description of KSUIComponent.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/johncahong/KSUIComponent'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'johncahong' => '305455947@qq.com' }
  s.source           = { :git => 'https://github.com/johncahong/KSUIComponent.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'



  ############
  s.subspec 'KSHub' do |ss|
      ss.source_files = 'KSUIComponent/Classes/KSHub/**/*'
      ss.dependency 'KSCategory/UIKit/UIButton'
      ss.dependency 'Masonry', '1.1.0'
  end

  s.subspec 'KSLoadingView' do |ss|
    ss.source_files = 'KSUIComponent/Classes/KSLoadingView/**/*'
    ss.resource_bundles = {
      'KSLoadingView' => ['KSUIComponent/Assets/KSLoadingView/*']
    }
  end
  
  
  # s.resource_bundles = {
  #   'KSUIComponent' => ['KSUIComponent/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
