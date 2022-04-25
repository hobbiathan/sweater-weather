class UnsplashService

  def self.search_photo(keyword)
    response = conn.get("/search/photos") do |req|
      req.params['query'] = keyword
      req.params['per_page'] = 1
    end

    format(response)
  end

  private
  def self.conn
    Faraday.new(url: "https://api.unsplash.com/") do |f|
      f.params['client_id'] = ENV['unsplash_api_key']
    end
  end

  def self.format(response)
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
