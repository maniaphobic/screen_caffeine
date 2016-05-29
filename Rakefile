#

ephemerals = Dir.glob(%w(*.gem *.lock))

task :build do
  system('gem build screen_caffeine.gemspec')
end

task :clean do
  system("rm -f #{ephemerals.join(' ')}")
end

task :critique do
  system('rubocop')
end

task :test do
  system('rspec')
end
