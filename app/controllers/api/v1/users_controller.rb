class Api::V1::UsersController < ApplicationController
  def create
    if params[:user].blank?
      error("no email provided")
    elsif params[:password].blank?
      error("no password provided")
    elsif params[:password_confirmation].blank?
      error("no password confirmation provided")
    else
      if valid_pass?
        user = User.create(user_params)

        json_response(UserSerializer.new(user), :created)
      else
        error("password and confirmation do not match")
      end
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation, :api_key)
    end

    def valid_pass?
      params[:password] == params[:password_confirmation]
    end

    def error(body)
      json_response({ "error": {"message" => body} }, :bad_request)
    end

    def self.gen_key
      SecureRandom.hex
    end

end
