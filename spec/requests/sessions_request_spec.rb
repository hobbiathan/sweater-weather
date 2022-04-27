require 'rails_helper'

RSpec.describe 'Sessions API' do
  context 'sessions POST' do
    before(:each) do
      @req_body = {

        "email": "hubert@gmail.com",
        "password": "password"

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
      expect(attributes.keys).to_not have_key(:password)
      expect(attributes.keys).to_not have_key(:password_confirmation)
      expect(attributes.keys).to_not have_key(:password_digest)
    end
  end

  context 'seesions POST fails' do
    before(:each) do
      @bad_req_body = {

        "email": "hubert@gmail.com",
        "password": "password1"

      }
    end

    it 'returns failure' do
      post '/api/v1/sessions', :params => @bad_req_body
      expect(response).to have_http_status(400)
    end
  end
end
