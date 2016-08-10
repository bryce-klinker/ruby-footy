require_relative 'referee.rb'
require_relative '../matches/match_gateway.rb'

class RefereeGateway
  def initialize(csv_path)
    @match_gateway = MatchGateway.new csv_path
  end

  def get_all
    matches = @match_gateway.get_all
    matches.group_by{ |m| m.referee_name }
        .map{ |g| Referee.new(g[0], matches) }
        .sort_by{ |r| r.name }
  end
end