require './app/poros/city_coord'
require './app/poros/route'

class MapquestFacade
  def self.find_coordinates(city)
    data = MapquestService.find_coordinates(city)
    coordinate_poro_format(data)
  end

  def self.find_route(start, destination)
    data = MapquestService.find_route(start, destination)
    route_poro_format(data)
  end

  private
  def self.coordinate_poro_format(coordinate_data)
    CityCoordPoro.new(latitude: coordinate_data[:lat], longitude: coordinate_data[:lng])
  end

  def self.route_poro_format(route_data)
    RoutePoro.new(route_data)
  end
end
