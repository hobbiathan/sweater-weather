class Api::V1::BackgroundsController < ApplicationController
  def index
    if params[:location].blank?
       json_response({ "error": {"message" => 'invalid parameters - no location provided'} }, :bad_request)
    else
      background = UnsplashFacade.search_photo(params[:location])
      json_response(BackgroundSerializer.new(background))
    end
  end
end
