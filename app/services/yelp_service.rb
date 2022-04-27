class YelpService

  def self.find_food(location, food)
    response = conn.get("/v3/businesses/search") do |req|
      req.params['location'] = location
      req.params['term'] = food
      req.params['limit'] = "1"
    end
    format(response)
  end

  private
    def self.conn
      Faraday.new(url: "https://api.yelp.com") do |f|
        f.headers['Authorization'] = "Bearer " + ENV['yelp_api_key']
      end
    end

    def self.format(response)
      data = JSON.parse(response.body, symbolize_names: true)[:businesses][0]
    end
end
