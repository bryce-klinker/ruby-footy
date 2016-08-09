require './src/referees/refereee_gateway'

When(/^I get all referees$/) do
  @refereee_gateway = RefereeGateway.new $csv_path
  @referees = @refereee_gateway.getAll
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