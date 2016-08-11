require 'json'

class Club
  def name
    @name
  end

  def wins
    @all_matches.select{ |m| m.is_winner name }
          .length
  end

  def draws
    @all_matches.select{ |m| m.is_draw name }
          .length
  end

  def losses
    @all_matches.select{ |m| m.is_loser name }
        .length
  end

  def points
    wins * 3 + draws
  end

  def goals_allowed
    allowed = 0
    @all_matches.map{ |m| m.allowed name }
      .each{ |a| allowed += a }
    allowed
  end

  def goals_scored
    scored = 0
    @all_matches.map{ |m| m.scored name }
      .each{ |s| scored += s }
    scored
  end

  def goal_differential
    goals_scored - goals_allowed
  end

  def initialize(name, all_matches)
    @name = name
    @all_matches = all_matches
  end

  def to_json
    {
        :name => name,
        :wins => wins,
        :draws => draws,
        :losses => losses,
        :points => points,
        :goals_allowed => goals_allowed,
        :goals_scored => goals_scored,
        :goal_differential => goal_differential
    }.to_json
  end
end