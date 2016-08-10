require_relative 'league'

class LeagueGateway
  def initialize(seasons_directory)
    @seasons_directory = seasons_directory
  end

  def get_all
    Dir.glob("#{@seasons_directory}/*.csv")
      .map{ |f| get_league_name_from_file f }
      .group_by{ |n| n }
      .map{ |g| League.new g[0] }
  end

  def get_league_name_from_file(filePath)
    extension = File.extname filePath
    file_name = File.basename filePath, extension
    parts = file_name.split('_')
    parts.drop(2).join(' ')
  end
end