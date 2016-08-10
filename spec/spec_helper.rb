require './src/shared/footy_config'

test_config_path = File.expand_path './config.test.yml'
FootyConfig.load(test_config_path)