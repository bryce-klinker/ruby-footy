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
end