class MunchiesSerializer

  def self.travel_info(routePoro, weatherPoro)
    {
    "data": {
        "id": "null",
        "type": "munchie",
        "attributes": {
              "destination_city": routePoro.destination_city,
              "travel_time": routePoro.travel_time,
              "forecast": {
                      "summary": weatherPoro.conditions,
                      "temperature": weatherPoro.temperature,
              },

              "restaurant": {
                      "date": nil,
                      "sunrise": nil
              }
    }
  }
}
  end
end
