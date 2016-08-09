require_relative 'match.rb'

class MatchGateway
  def initialize(csv_path)
    @csv_path = csv_path
  end

  def get_all
    File.readlines(@csv_path)
        .drop(1)
        .map{ |line| Match.new(line) }
  end
end