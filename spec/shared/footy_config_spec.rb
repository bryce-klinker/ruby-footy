require './src/shared/footy_config'

describe 'FootyConfig' do

  before do
    config_path = File.expand_path '../../../config.yml', __FILE__
    FootyConfig.load(config_path)
  end

  it 'should have seasons directory' do
    expect(FootyConfig.seasons_directory).to eql File.expand_path './data/seasons'
  end
end