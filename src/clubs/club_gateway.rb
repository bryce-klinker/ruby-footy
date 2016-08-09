class ClubGateway
  def initialize(csvPath)
    @csvPath = csvPath
  end

  def getAll
    arsenal = {:name => 'Arsenal' }
    clubs = []
    clubs.push(arsenal)
    return clubs
  end
end