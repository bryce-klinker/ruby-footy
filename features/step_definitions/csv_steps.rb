require './src/shared/data_path_helper'

Given(/^2015_2016 Premier League data$/) do
  $csv_path = File.expand_path "#{get_seasons_directory_path}/2015_2016_Premier_League.csv", __FILE__
end