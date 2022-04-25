require './app/poros/food'

class YelpFacade
  def self.find_food(location, food)
    data = YelpService.find_food(location, food)
    FoodPoro.new(data)
  end
end
