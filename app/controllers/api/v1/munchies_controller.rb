class Api::V1::MunchiesController < ApplicationController
  def index
    if params[:start].blank?
       json_response({ "error": {"message" => 'invalid parameters - no start location provided'} }, :bad_request)
    elsif params[:destination].blank?
      json_response({ "error": {"message" => 'invalid parameters - no destination location provided'} }, :bad_request)
    elsif params[:food].blank?
      json_response({ "error": {"message" => 'invalid parameters - no food provided'} }, :bad_request)
    else
      routePoro = find_route(params[:start], params[:destination])
      weatherPoro = get_weather(params[:destination])
      foodPoro = find_food(params[:destination], params[:food])
      json_response(MunchiesSerializer.travel_info(routePoro, weatherPoro, foodPoro))
    end
  end

  private
    def find_route(start, destination)
      MapquestFacade.find_route(params[:start], params[:destination])
    end

    def get_weather(destination)
      coordinates = MapquestFacade.find_coordinates(params[:destination])
      forecasts = OpenweatherFacade.format_weather(coordinates)[0]
    end

    def find_food(location, food)
      YelpFacade.find_food(location, food)
    end
end
