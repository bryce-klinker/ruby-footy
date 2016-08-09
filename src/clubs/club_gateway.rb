class ClubGateway
  def initialize(csvPath)
    @csvPath = csvPath
  end

  def getAll
    return getClubNames()
      .map{ |n| { name: n }}
  end

  private
    def getClubNames
      lines = File.readlines(@csvPath)
      return lines.drop(1)
        .collect{ |l| getClubName(l)}
        .uniq { |l| l }
        .sort_by{|l| l }
    end

    def getClubName(line)
      return line.split(',')[2]
    end
end