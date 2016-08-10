Feature: Seasons
  As a football fan
  I want to have seasons
  So that I can track my club across seasons

  Scenario: Get Season for Premier League
    Given 2015_2016 Premier League data
    When I get season 2015_2016 Premier League season
    Then I should get all 20 clubs in 2015_2016 Premier League season
    Then I should have leader board for 2015_2016 Premier League season
    Then I should get all referees in 2015_2016 Premier League season