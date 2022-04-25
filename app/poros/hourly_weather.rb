class HourlyWeatherPoro
  attr_reader :time, :temperature, :conditions, :icon

  def initialize(weather_data)
    @time = format_date(weather_data[0][:dt]).strftime("%H:%M:%S")
    @temperature = weather_data[0][:temp]
    @conditions = weather_data[0][:weather][0][:description]
    @icon = weather_data[0][:weather][0][:icon]
  end

  private
  def format_date(time_date)
    Time.at(time_date)
  end
end
