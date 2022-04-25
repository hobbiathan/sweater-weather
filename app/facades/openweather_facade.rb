require './app/poros/current_weather'
require './app/poros/hourly_weather'
require './app/poros/daily_weather'


class OpenweatherFacade
  def self.get_weather(location)
    coordinates = MapquestFacade.find_coordinates(location)
    data = OpenweatherService.get_weather(coordinates.latitude, coordinates.longitude)
  end

  def self.format_weather(location)
    unfor_weather = get_weather(location)

    current_weather = CurrentWeatherPoro.new(unfor_weather[:current])
    hourly_weather = HourlyWeatherPoro.new(unfor_weather[:hourly])
    daily_weather = DailyWeatherPoro.new(unfor_weather[:daily])

    return [current_weather, hourly_weather, daily_weather]
  end


end
