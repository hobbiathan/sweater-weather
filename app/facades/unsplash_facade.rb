require './app/poros/photo'

class UnsplashFacade
  def self.search_photo(location)
    data = UnsplashService.search_photo(location)[:results][0]
    PhotoPoro.new(data)
  end
end
