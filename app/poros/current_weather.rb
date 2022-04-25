class CurrentWeatherPoro
  attr_reader :datetime, :sunrise, :sunset, :temperature, :feels_like,
              :humidity, :uvi, :visibility, :conditions, :icon

  def initialize(weather_data)
    @datetime = format_date(weather_data[:dt])
    @sunrise = format_date(weather_data[:sunrise])
    @sunset = format_date(weather_data[:sunset])
    @temperature = weather_data[:temp]
    @feels_like = weather_data[:feels_like]
    @humidity = weather_data[:humidity]
    @uvi = weather_data[:uvi]
    @visibility = weather_data[:visibility]
    @conditions = weather_data[:weather][0][:description]
    @icon = weather_data[:weather][0][:icon]
  end

  private
  def format_date(time_date)
    Time.at(time_date)
  end
end
