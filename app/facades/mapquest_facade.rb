require './app/poros/city_coord'

class MapquestFacade
  def self.find_coordinates(city)
    data = MapquestService.find_coordinates(city)
    coordinate_poro_format(data)
  end

  private
  def self.coordinate_poro_format(coordinate_data)
    CityCoordPoro.new(latitude: coordinate_data[:lat], longitude: coordinate_data[:lng])
  end
end
