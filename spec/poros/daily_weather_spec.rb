require 'rails_helper'
require './app/poros/daily_weather'

RSpec.describe 'Current Weather Poro' do
  before(:each) do
    @data = [{

                      "dt": 3,
                      "sunrise": 5,
                      "sunset": 10,
                      "moonrise": 12,
                      "moonset": 66,
                      "moonphase": 0.75,

                      "temp": {
                        "day": 22.38,
                        "min": 16.13,
                        "max": 35.57,
                        "night": 66.31,
                        "eve": 99.27,
                        "morn": 63.92
                      },

                      "feels_like": {
                         "day": 82.17,
                         "night": 69.33,
                         "eve": 75.42,
                         "morn": 68.85
                     },

                     "pressure": 1013,
                     "humidity": 43,
                     "dew_point": 57.67,
                     "wind_speed": 20.29,
                     "wind_deg": 185,
                     "wind_gust": 38.16,

                      "weather": [
                                    {
                                      "id": 803,
                                      "main": "Clouds",
                                      "description": "themonuclear bomb seems to have exploded",
                                      "icon": "soup"
                                    }
                      ],
                      "clouds": 600,
                      "pop": 12,
                      "uvi": 6106
                    }]

    @dailyWeatherPoro = DailyWeatherPoro.new(@data)
  end

  it 'exists' do
    expect(@dailyWeatherPoro).to be_a(DailyWeatherPoro)
  end

  it 'contains respective attributes' do
    expect(@dailyWeatherPoro.date).to eq(Time.at(3).strftime("%F"))
    expect(@dailyWeatherPoro.sunrise).to eq(Time.at(5))
    expect(@dailyWeatherPoro.sunset).to eq(Time.at(10))
    expect(@dailyWeatherPoro.max_temp).to eq(35.57)
    expect(@dailyWeatherPoro.min_temp).to eq(16.13)
    expect(@dailyWeatherPoro.conditions).to eq('themonuclear bomb seems to have exploded')
    expect(@dailyWeatherPoro.icon).to eq('soup')
  end
end
