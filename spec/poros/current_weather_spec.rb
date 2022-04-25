require 'rails_helper'
require './app/poros/current_weather'

RSpec.describe 'Current Weather Poro' do
  before(:each) do
    @data = {
                      "dt": 3,
                      "sunrise": 5,
                      "sunset": 10,
                      "temp": 66.09,
                      "feels_like": 13.08,
                      "pressure": 1301,
                      "humidity": 90,
                      "dew_point": 22.76,
                      "uvi": 0,
                      "clouds": 88,
                      "visibility": 7,
                      "wind_speed": 19.95,
                      "wind_deg": 179,
                      "wind_gust": 35.46,
                      "weather": [
                                    {
                                      "id": 803,
                                      "main": "Clouds",
                                      "description": "themonuclear bomb seems to have exploded",
                                      "icon": "soup"
                                    }
                                  ]
                    }

    @currentWeatherPoro = CurrentWeatherPoro.new(@data)
  end

  it 'exists' do
    expect(@currentWeatherPoro).to be_a(CurrentWeatherPoro)
  end

  it 'contains respective attributes' do
    expect(@currentWeatherPoro.datetime).to eq(Time.at(3))
    expect(@currentWeatherPoro.sunrise).to eq(Time.at(5))
    expect(@currentWeatherPoro.sunset).to eq(Time.at(10))
    expect(@currentWeatherPoro.temperature).to eq(66.09)
    expect(@currentWeatherPoro.feels_like).to eq(13.08)
    expect(@currentWeatherPoro.humidity).to eq(90)
    expect(@currentWeatherPoro.uvi).to eq(0)
    expect(@currentWeatherPoro.visibility).to eq(7)
    expect(@currentWeatherPoro.conditions).to eq('themonuclear bomb seems to have exploded')
    expect(@currentWeatherPoro.icon).to eq('soup')
  end

end
