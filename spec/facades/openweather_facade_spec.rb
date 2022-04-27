require 'rails_helper'

RSpec.describe OpenweatherFacade do
 it "::get_weather", :vcr do
   data = "denver"
   weather = OpenweatherFacade.get_weather(data)
   expect(weather).to be_a Hash
   expect(weather).to_not have_key(:minutely)
   expect(weather[0]).to have_key(:dt)
   expect(weather[0]).to have_key(:sunrise)
   expect(weather[0]).to have_key(:sunset)
   expect(weather[0]).to have_key(:temp)
   expect(weather[0]).to have_key(:feels_like)
   expect(weather[0]).to have_key(:humidity)
   expect(weather[0]).to have_key(:uvi)
   expect(weather[0]).to have_key(:visibility)
   expect(weather[0][:weather_data][0]).to have_key(:description)
   expect(weather[0][:weather_data][0]).to have_key(:icon)
  end
end
