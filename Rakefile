task :rspec do
  sh 'bundle exec rspec --require ./spec/spec_helper.rb --format documentation'
end

task :cucumber do
  sh 'cucumber'
end

task :run do
  sh 'SEASONS_DIRECTORY="./data/seasons" ruby ./src/footy_app.rb'
end

task :default => [:rspec, :cucumber]