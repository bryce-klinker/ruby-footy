Feature: Referees
  As a football fan
  I want to know which referees are in the Premier League
  So that I know who to blame for my club losing

  Scenario: Get Referees in Premier League
    Given 2015_2016 Premier League data
    When I get all referees for 2015_2016 Premier League season
    Then I should get Premier League referees for the 2015/2016 season
    Then I should get red cards given per referee
    Then I should get yellow cards given per referee
