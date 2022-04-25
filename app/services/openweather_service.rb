class OpenweatherService
  def self.get_weather(latitude, longitude)
    response = conn.get("/data/2.5/onecall?lat=#{latitude}&lon=#{longitude}&exclude=minutely,alerts&appid=#{ENV['openweather_api_key']}&units=imperial")
    format(response)
  end

  private
  def self.conn
    Faraday.new(url: "https://api.openweathermap.org")
  end

  def self.format(response)
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
