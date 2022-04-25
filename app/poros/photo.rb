class PhotoPoro
  attr_reader :id, :source, :image_url, :photographer, :profile

  def initialize(data)
    @id = data[:id] # what
    @source = "unsplash.com"
    @image_url = data[:urls][:regular]
    @photographer = data[:user][:name]
    @profile = data[:user][:portfolio_url]
  end
end
