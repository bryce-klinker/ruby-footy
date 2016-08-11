require 'yaml'

module FootyConfig
  extend self

  def seasons_directory
    File.expand_path @config['seasons_directory']
  end

  def load(config_file_path)
    @config = YAML.load_file config_file_path
  end
end
