require_relative 'club.rb'
require_relative 'match.rb'

class ClubGateway
  def initialize(csvPath)
    @csvPath = csvPath
  end

  def getAll
    matches = File.readlines(@csvPath)
                  .drop(1)
                  .map{ |line| Match.new(line) }

    return matches.group_by{ |match| match.host_name }
                  .map{ |g| Club.new(g[0], matches) }
                  .sort_by{ |c| c.name }
  end
end