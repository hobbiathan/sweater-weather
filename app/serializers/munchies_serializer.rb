class ForecastSerializer

  def self.travel_info(data)
    {
    "data": {
        "id": "null",
        "type": "munchie",
        "attributes": {
              "destination_city": data[:destination_city],
              "travel_time": data[:travel_time],
              "forecast": {
                      "summary": data[:forecast][:summary],
                      "temperature": data[:forecast][:temperature],
              },

              "restaurant": {
                      "date": daily_weather.date,
                      "sunrise": daily_weather.sunrise,
              }
    }
  }
}
  end
end
