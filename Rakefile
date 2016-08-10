task :unit_test do
  sh 'bundle exec rspec --require ./spec/spec_helper.rb --format documentation'
end

task :cucumber_test do
  sh 'cucumber'
end

task :default => [:unit_test, :cucumber_test]