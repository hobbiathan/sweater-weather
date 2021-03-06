class MapquestService

  def self.find_coordinates(city)
    response = conn.get("address") do |req|
      req.params['location'] = city
    end
    format(response)
  end

  def self.find_route(start, destination)
    response = conn_directions.get("route") do |req|
      req.params['from'] = start
      req.params['to'] = destination
    end
    format_directions(response)
  end

  private
  def self.conn_directions
    Faraday.new(url: "http://www.mapquestapi.com/directions/v2") do |f|
      f.params['key'] = ENV['mapquest_api_key']
    end
  end

  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com/geocoding/v1") do |f|
      f.params['key'] = ENV['mapquest_api_key']
    end
  end

  def self.format(response)
    data = JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0][:latLng]
  end

  def self.format_directions(response)
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
