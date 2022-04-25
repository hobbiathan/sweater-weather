class DailyWeatherPoro
  attr_reader :date, :sunrise, :sunset, :max_temp, :min_temp,
              :conditions, :icon

  def initialize(weather_data)
    @date = format_date(weather_data[0][:dt]).strftime("%F")
    @sunrise = format_date(weather_data[0][:sunrise])
    @sunset = format_date(weather_data[0][:sunset])
    @max_temp = weather_data[0][:temp][:max]
    @min_temp = weather_data[0][:temp][:min]
    @conditions = weather_data[0][:weather][0][:description]
    @icon = weather_data[0][:weather][0][:icon]
  end

  private
  def format_date(time_date)
    Time.at(time_date)
  end
end
