class Api::V1::SessionsController < ApplicationController
  def create
    if params[:session.blank?]
      error("no body provided")
    else
      user = User.find_by_email(params[:email])

      if !!(user.authenticate(params[:password]))
        json_response(UserSerializer.new(user))
      else
        error("invalid credentials", :unauthorized)
      end
    end
  end

  private

    def error(body, req = :bad_request)
      json_response({ "error": {"message" => body} }, req)
    end
end
