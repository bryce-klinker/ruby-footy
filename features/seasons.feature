Feature: Seasons
  As a football fan
  I want to have seasons
  So that I can track my club across seasons

  Scenario: Get Premier League Season with related data
    Given 2015_2016 Premier League data
    When I get season 2015_2016 Premier League season with all related data
    Then I should get all 20 clubs in 2015_2016 Premier League season
    Then I should have leader board for 2015_2016 Premier League season
    Then I should get all referees in 2015_2016 Premier League season
    Then I should get all 380 matches in 2015_2016 Premier League season

  Scenario: Get Premier League Season with no related data
    Given 2015_2016 Premier League data
    When I get season 2015_2016 Premier League season
    Then I should not get clubs
    Then I should not get leader board
    Then I should not get matches
    Then I should not get referees

  Scenario: Get Premier League Seasons
    When I get Premier League seasons
    Then I should get 2015_2016 Premier League season
    Then I should get 2014_2015 Premier League season