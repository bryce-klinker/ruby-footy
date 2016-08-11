require_relative 'season'

class SeasonGateway
  def initialize(seasons_directory)
    @seasons_directory = seasons_directory
  end

  def get_by_league_name(league_name)
    Dir.glob("#{@seasons_directory}/*_#{league_name.gsub(' ', '_')}.csv")
      .map{ |f| Season.new(f)}
      .sort_by { |s| s.start_year }.reverse
  end

  def get_season(start_year, end_year, league_name)
    season_path = File.expand_path "#{@seasons_directory}/#{start_year}_#{end_year}_#{league_name.gsub(' ', '_')}.csv"
    Season.new season_path
  end
end