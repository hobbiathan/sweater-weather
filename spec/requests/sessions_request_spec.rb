require 'rails_helper'

RSpec.describe 'Sessions API', type: :request do
  context 'sessions POST' do
    before(:each) do
      User.create!(email: 'huberb@gmail.com', password: 'passwor', password_confirmation: 'passwor')

      @req_body = {

        "email": "huberb@gmail.com",
        "password": "passwor"

      }
    end

    it 'is successful' do
      post '/api/v1/sessions', :params => @req_body

      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'returns formatted, sanitized json of user attributes' do
      post '/api/v1/sessions', :params => @req_body
      attributes = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
      expect(attributes.keys).to eq([:email, :api_key])
      expect(attributes.has_key?(:password)).to be false
      expect(attributes.has_key?(:password_confirmation)).to be false
      expect(attributes.has_key?(:password_digest)).to be false
    end
  end

  context 'sessions POST fails' do
    before(:each) do
      User.create!(email: 'huberb@gmail.com', password: 'passwor', password_confirmation: 'passwor')

      @bad_req_body = {

        "email": "huberb@gmail.com",
        "password": "password1"

      }
    end

    it 'returns failure' do
      post '/api/v1/sessions', :params => @bad_req_body
      expect(response).to have_http_status(401)
    end

    it 'returns proper body' do
      post '/api/v1/sessions', :params => @bad_req_body
      expect(json[:error]).to eq({:message=>"invalid credentials"})
    end
  end
end
