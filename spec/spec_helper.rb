require './src/shared/footy_config'

test_config_path = File.expand_path './config.test.yml'
FootyConfig.load(test_config_path)

def get_season_csv_path(start_year, end_year, league_name)

end