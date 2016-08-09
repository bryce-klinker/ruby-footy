require_relative 'club.rb'
require_relative '../matches/match_gateway.rb'

class ClubGateway
  def initialize(csv_path)
    @match_gateway = MatchGateway.new csv_path
  end

  def get_all
    matches = @match_gateway.get_all

    matches.group_by{ |match| match.host }
        .map{ |g| Club.new(g[0], matches) }
        .sort_by{ |c| c.name }
  end
end