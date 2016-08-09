require_relative 'referee.rb'

class RefereeGateway
  def initialize(csv_path)
    @csv_path = csv_path
  end

  def getAll
    File.readlines(@csv_path)
        .drop(1)
        .group_by{ |l| l.split(',')[10] }
        .map{ |g| Referee.new(g[0]) }
        .sort_by{ |r| r.name }
  end
end