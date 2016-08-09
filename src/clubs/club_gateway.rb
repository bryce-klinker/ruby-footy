require_relative 'club.rb'

class ClubGateway
  def initialize(csvPath)
    @csvPath = csvPath
  end

  def getAll
    lines = File.readlines(@csvPath)
    return lines
      .drop(1)
      .group_by{ |line| getClubName line }
      .map{ |g| Club.new(g[0], lines) }
      .sort_by{ |c| c.name }
  end

  private
    def getClubName(line)
      return line.split(',')[2]
    end
end