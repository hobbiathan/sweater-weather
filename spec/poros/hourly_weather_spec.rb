require 'rails_helper'
require './app/poros/hourly_weather'

RSpec.describe 'Current Weather Poro' do
  before(:each) do
    @data = [{
      "dt": 300,
      "sunrise": 5,
      "sunset": 10,
      "temp": 103.39,
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
    }]


    @hourlyWeatherPoro = HourlyWeatherPoro.new(@data)
  end

  it 'exists' do
    expect(@hourlyWeatherPoro).to be_a(HourlyWeatherPoro)
  end

  it 'contains respective attributes' do
    expect(@hourlyWeatherPoro.time).to eq(Time.at(300).strftime("%H:%M:%S"))
    expect(@hourlyWeatherPoro.temperature).to eq(103.39)
    expect(@hourlyWeatherPoro.conditions).to eq("themonuclear bomb seems to have exploded")
    expect(@hourlyWeatherPoro.icon).to eq('soup')

  end

end
