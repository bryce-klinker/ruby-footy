Feature: Leagues
  As a football fan
  I want to have leagues
  So that I can track my club across leagues

  Scenario: Get leagues
    When I get leagues
    Then I should get the league Premier League
    Then I should get the league Championship

  Scenario: Get league seasons
    When I get league Premier League
    Then I should get 2015_2016 season