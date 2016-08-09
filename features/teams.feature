Feature: Get clubs in the Premier League
  As a football fan
  I want to know which teams are in the Premier League
  So that I can track my club


  Scenario: Get clubs in Premier League
    Given 2015/2016 Premier League data
    When I get all teams
    Then I should get Premier League teams for the 2015/2016 season
