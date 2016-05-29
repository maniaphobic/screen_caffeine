Gem::Specification.new do |s|
  s.authors     = ['mANIApHOBIC']
  s.bindir      = 'run'
  s.description = <<-EOF
Debian-based Linux distributions possess no facility to disable the
screensaver while watching video. This gem uses the "xte" command from
the "xautomation" Debian package to move the mouse one pixel per
minute, which resets the screensaver's timer and prevents it from activating.
  EOF
  s.email       = 'git@maniaphobic.org'
  s.executables << 'screen_caffeine'
  s.files       = Dir.glob('lib/screen_caffeine/*.rb')
  s.homepage    = 'https://animalaidpdx.org'
  s.licenses    = ['MIT']
  s.name        = 'screen_caffeine'
  s.summary     = 'Reset the Linux screensaver timeout while watching video'
  s.version     = '0.1.5'
end
