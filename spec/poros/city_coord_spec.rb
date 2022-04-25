require 'rails_helper'
require './app/poros/city_coord'

RSpec.describe 'City Coordinate Poro' do
  before(:each) do
    @data = {
      latitude: 37.2431,
      longitude: 115.7930
    }

    @cityPoro = CityCoordPoro.new(@data)
  end

  it 'exists' do
    expect(@cityPoro).to be_a(CityCoordPoro)
  end

  it 'contains longitude and latitude' do
    expect(@cityPoro.latitude).to eq(@data[:latitude])
    expect(@cityPoro.longitude).to eq(@data[:longitude])
  end
end
