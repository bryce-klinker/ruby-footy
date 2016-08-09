class ClubGateway
  def initialize(csvPath)
    @csvPath = csvPath
  end

  def getAll
    return Array.new(20)
  end
end