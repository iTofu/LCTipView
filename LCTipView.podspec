Pod::Spec.new do |s|

  s.name         = "LCTipView"
  s.version      = "1.0.2"
  s.summary      = "A lovely HUD~ Support: http://LeoDev.me"
  s.homepage     = "https://github.com/iTofu/LCTipView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Leo" => "devtip@163.com" }
  s.social_media_url   = "http://LeoDev.me"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/iTofu/LCTipView.git", :tag => s.version }
  s.source_files = "LCTipView/*"
  s.resource     = 'LCTipView/LCTipView.bundle'
  s.requires_arc = true

  s.dependency "Masonry", "1.0.0"
  s.dependency "GPUImage", "0.1.1"

end
