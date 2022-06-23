
Pod::Spec.new do |s|
  s.name             = 'KSUIComponent'
  s.version          = '0.1.0'
  s.summary          = 'A short description of KSUIComponent.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/johncahong/KSUIComponent'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'johncahong' => '305455947@qq.com' }
  s.source           = { :git => 'https://github.com/johncahong/KSUIComponent.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'


  ############
  # subspec表示库的模块，用于划分目录，这样别人导入时才会以目录形式划分，且使用时可以单独导入模块
  s.subspec 'KSHub' do |ss|
      ss.source_files = 'KSUIComponent/Classes/KSHub/**/*'
      ss.dependency 'KSCategory/UIKit/UIButton'
      ss.dependency 'Masonry', '1.1.0'
  end

  s.subspec 'KSLoadingView' do |ss|
      ss.source_files = 'KSUIComponent/Classes/KSLoadingView/**/*'
      ss.resource_bundles = {
        'KSLoadingView' => ['KSUIComponent/Assets/KSLoadingView/*.png']
      }
      ss.dependency 'Masonry', '1.1.0'
  end

  # s.resource_bundles = {
  #   'KSUIComponent' => ['KSUIComponent/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
