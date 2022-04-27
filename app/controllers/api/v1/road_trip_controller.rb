class Api::V1::RoadTripController < ApplicationController
  def create
    if params[:road_trip].blank?
      error("no body provided")
    elsif params[:origin].blank? || params[:destination].blank? || params[:api_key].blank?
      error("required parameters missing/empty")
    else
      user = User.find_by_api_key(params[:api_key])
      if !!(user)

        valid_route = MapquestService.find_route(params[:origin], params[:destination])

        if valid_route[:info][:statuscode] == 402
          error("impossible route")
        else
          origin = params[:origin]
          routePoro = MapquestFacade.find_route(params[:origin], params[:destination]) # Bypass Route Poro
          weatherPoro = get_weather(params[:destination])

          json_response(RoadTripSerializer.trip_details(origin, routePoro, weatherPoro))
        end
      else
        error("invalid credentials", :unauthorized)
      end
    end
  end


  private

    def get_weather(destination)
      coordinates = MapquestFacade.find_coordinates(params[:destination])
      forecasts = OpenweatherFacade.format_weather(coordinates)[0]
    end

    def find_route(origin, destination)
      MapquestFacade.find_route(origin, destination)
    end

    def error(body, req = :bad_request)
      json_response({ "error": {"message" => body} }, req)
    end
end
