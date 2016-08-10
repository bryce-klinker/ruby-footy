require './src/referees/referee_gateway'

When(/^I get all referees$/) do
  @referee_gateway = RefereeGateway.new $csv_path
  @referees = @referee_gateway.get_all
end

Then(/^I should get Premier League referees for the 2015\/2016 season$/) do
  expect(@referees.length).to eql 19
  @referee_names = @referees.collect{ |r| r.name }

  expect(@referee_names).to include 'M Clattenburg'
  expect(@referee_names).to include 'M Oliver'
  expect(@referee_names).to include 'M Jones'
  expect(@referee_names).to include 'L Mason'
  expect(@referee_names).to include 'J Moss'
  expect(@referee_names).to include 'S Hooper'
  expect(@referee_names).to include 'M Atkinson'
  expect(@referee_names).to include 'C Pawson'
  expect(@referee_names).to include 'A Taylor'
  expect(@referee_names).to include 'M Dean'
  expect(@referee_names).to include 'K Friend'
  expect(@referee_names).to include 'R Madley'
  expect(@referee_names).to include 'P Tierney'
  expect(@referee_names).to include 'K Stroud'
  expect(@referee_names).to include 'N Swarbrick'
  expect(@referee_names).to include 'A Marriner'
  expect(@referee_names).to include 'S Attwell'
  expect(@referee_names).to include 'R East'
  expect(@referee_names).to include 'G Scott'
end

Then(/^I should get red cards given per referee$/) do
  expect_referee_red_cards_given 'M Oliver', 5
  expect_referee_red_cards_given 'M Jones', 3
  expect_referee_red_cards_given 'A Taylor', 5
  expect_referee_red_cards_given 'J Moss', 5
  expect_referee_red_cards_given 'M Clattenburg', 6
  expect_referee_red_cards_given 'K Friend', 3
  expect_referee_red_cards_given 'A Marriner', 4
  expect_referee_red_cards_given 'R Madley', 5
  expect_referee_red_cards_given 'M Dean', 9
  expect_referee_red_cards_given 'S Attwell', 1
  expect_referee_red_cards_given 'N Swarbrick', 4
  expect_referee_red_cards_given 'L Mason', 3
  expect_referee_red_cards_given 'K Stroud', 1
  expect_referee_red_cards_given 'C Pawson', 2
  expect_referee_red_cards_given 'G Scott', 1
  expect_referee_red_cards_given 'M Atkinson', 1
  expect_referee_red_cards_given 'R East', 1
  expect_referee_red_cards_given 'S Hooper', 0
  expect_referee_red_cards_given 'P Tierney', 0
end

Then(/^I should get yellow cards given per referee$/) do
  expect_referee_yellow_cards_given 'M Oliver', 89
  expect_referee_yellow_cards_given 'M Jones', 82
  expect_referee_yellow_cards_given 'A Taylor', 107
  expect_referee_yellow_cards_given 'J Moss', 71
  expect_referee_yellow_cards_given 'M Clattenburg', 95
  expect_referee_yellow_cards_given 'K Friend', 59
  expect_referee_yellow_cards_given 'A Marriner', 84
  expect_referee_yellow_cards_given 'R Madley', 70
  expect_referee_yellow_cards_given 'M Dean', 106
  expect_referee_yellow_cards_given 'S Attwell', 12
  expect_referee_yellow_cards_given 'N Swarbrick', 54
  expect_referee_yellow_cards_given 'L Mason', 55
  expect_referee_yellow_cards_given 'K Stroud', 9
  expect_referee_yellow_cards_given 'C Pawson', 87
  expect_referee_yellow_cards_given 'G Scott', 16
  expect_referee_yellow_cards_given 'M Atkinson', 99
  expect_referee_yellow_cards_given 'R East', 71
  expect_referee_yellow_cards_given 'S Hooper', 1
  expect_referee_yellow_cards_given 'P Tierney', 12
end

def expect_referee_red_cards_given(referee_name, red_cards_given)
  referee = @referees.select{ |r| r.name == referee_name }.first
  expect(referee.red_cards_given).to eql red_cards_given
end

def expect_referee_yellow_cards_given(referee_name, yellow_cards_given)
  referee = @referees.select{ |r| r.name == referee_name }.first
  expect(referee.yellow_cards_given).to eql yellow_cards_given
end