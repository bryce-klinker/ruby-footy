require './src/shared/footy_config'

Given(/^2015_2016 Premier League data$/) do
  $csv_path = File.expand_path "#{FootyConfig.seasons_directory}/2015_2016_Premier_League.csv", __FILE__
end