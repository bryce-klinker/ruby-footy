class Referee
  def name
    @name
  end

  def red_cards_given
    red_cards_given = 0
    @all_matches.select{ |m| m.is_referee name }
      .map{ |m| m.red_cards_given }
      .each{ |rcg| red_cards_given += rcg }

    red_cards_given
  end

  def yellow_cards_given
    yellow_cards_given = 0
    @all_matches.select{ |m| m.is_referee name }
        .map{ |m| m.yellow_cards_given }
        .each{ |ycg| yellow_cards_given += ycg }

    yellow_cards_given
  end

  def initialize(name, all_matches)
    @name = name
    @all_matches = all_matches
  end
end