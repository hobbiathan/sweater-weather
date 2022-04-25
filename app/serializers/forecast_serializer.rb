class ForecastSerializer

  def self.weather_forecasts(current_weather, hourly_weather, daily_weather)
    {
    "data": {
        "id": "null",
        "type": "forecast",
        "attributes": {
              "current_weather": {
                                  "datetime": current_weather.datetime,
                                  "sunrise": current_weather.sunrise,
                                  "sunset": current_weather.sunset,
                                  "temperature": current_weather.temperature,
                                  "feels_like": current_weather.feels_like,
                                  "humidity": current_weather.humidity,
                                  "uvi": current_weather.uvi,
                                  "visibility": current_weather.visibility,
                                  "conditions": current_weather.conditions,
                                  "icon": current_weather.icon
                                  },
              "daily_weather": [
                    {
                      "date": daily_weather.date,
                      "sunrise": daily_weather.sunrise,
                      "sunset": daily_weather.sunset,
                      "max_temp": daily_weather.max_temp,
                      "min_temp": daily_weather.min_temp,
                      "conditions": daily_weather.conditions,
                      "icon": daily_weather.icon
                    }
                    ],
              "hourly_weather": [
                    {
                      "time": hourly_weather.time,
                      "temperature": hourly_weather.temperature,
                      "conditions": hourly_weather.conditions,
                      "icon": hourly_weather.icon
                    }
                ]
              }
        }
    }
  end
end
