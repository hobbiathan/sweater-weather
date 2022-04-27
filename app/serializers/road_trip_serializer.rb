class RoadTripSerializer
  def self.trip_details(origin, routePoro, weatherPoro)
    {
      "data": {

        "id": nil,
        "type": "roadtrip",
        "attributes": {

          "start_city": origin,
          "end_city:": routePoro.destination_city,
          "travel_time": routePoro.travel_time,
          "weather_at_eta": {

            "temperature": weatherPoro.temperature,
            "conditions": weatherPoro.conditions

          }


        }

      }
    }
  end
end
