require_relative 'season'

class SeasonGateway
  def initialize
    @seasons_directory = File.expand_path './data/seasons'
  end

  def get_by_league_name(league_name)
    Dir.glob("#{@seasons_directory}/*_#{league_name.gsub(' ', '_')}.csv")
      .map{ |f| create_season_from_file f, league_name }
      .sort_by { |s| s.start_year }.reverse
  end

  def create_season_from_file(file_path, league_name)
    file_name = File.basename file_path
    parts = file_name.split('_')
    Season.new parts[0], parts[1], league_name
  end
end