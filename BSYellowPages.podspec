Pod::Spec.new do |spec|
  spec.name         = 'BSYellowPages'
  spec.version      = '1.0.0'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage     = 'https://github.com/iBlacksus/BSYellowPages'
  spec.authors      = { 'iBlacksus' => 'iblacksus@gmail.com' }
  spec.summary      = 'An iOS customizable ScrollIndicator'
  spec.source       = { :git => 'https://github.com/iBlacksus/BSYellowPages.git', :tag => '1.0.0' }
  spec.source_files = 'BSYellowPages/**/*'
  spec.framework    = 'SystemConfiguration'
  spec.ios.deployment_target  = '8.0'
  spec.ios.framework  = 'UIKit'
end