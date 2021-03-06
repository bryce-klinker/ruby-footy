require_relative 'league'
require_relative '../shared/csv_path_helper'

class LeagueGateway
  def initialize(seasons_directory)
    @seasons_directory = seasons_directory
  end

  def get_all
    Dir.glob("#{@seasons_directory}/*.csv")
      .map{ |f| get_league_name_from_csv_path f }
      .group_by{ |n| n }
      .map{ |g| League.new g[0], @seasons_directory }
  end

  def get_by_name(league_name)
    get_all.select{ |l| l.name == league_name.gsub('_', ' ')}.first
  end
end