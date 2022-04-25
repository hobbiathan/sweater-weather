class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location].blank?
       json_response({ "error": {"message" => 'invalid parameters - no location provided'} }, :bad_request)
    else
      coordinates = MapquestFacade.find_coordinates(params[:location])
      forecasts = OpenweatherFacade.format_weather(coordinates)
      json_response(ForecastSerializer.weather_forecasts(forecasts[0], forecasts[1], forecasts[2]))
    end
  end
end
