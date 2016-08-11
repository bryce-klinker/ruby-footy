task :rspec do
  sh 'bundle exec rspec --require ./spec/spec_helper.rb --format documentation'
end

task :cucumber do
  sh 'cucumber'
end

task :default => [:rspec, :cucumber]