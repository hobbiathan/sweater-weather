class Api::V1::RoadTripController < ApplicationController
  def create
    binding.pry
    if params[:road_trip].blank?
      error("no body provided")
    elsif params[:origin].blank? || params[:destination].blank? || params[:api_key].blank?
      error("required parameters missing/empty")
    else
      user = User.find_by_api_key(params[:api_key])
    end
  end


  private

    def error(body, req = :bad_request)
      json_response({ "error": {"message" => body} }, req)
    end
end
