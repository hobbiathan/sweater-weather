class BackgroundSerializer
  include JSONAPI::Serializer
  attributes :id, :source, :image_url, :photographer, :profile
end
