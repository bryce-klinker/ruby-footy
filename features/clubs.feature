Feature: Get clubs in the Premier League
  As a football fan
  I want to know which teams are in the Premier League
  So that I can track my club


  Scenario: Get clubs in Premier League
    Given 2015/2016 Premier League data
    When I get all clubs
    Then I should get Premier League clubs for the 2015/2016 season
    Then I should get each club's name
    Then I should get each club's number of wins
    Then I should get each club's number of draws
    Then I should get each club's number of losses
    Then I should get each club's point total