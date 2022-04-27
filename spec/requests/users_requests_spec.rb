require 'rails_helper'

RSpec.describe 'Users API', type: :request do

    describe 'POST  /api/v1/users' do
      before(:each) do

         @req_body = {
                          "user": {"email": 'hubert@test.com'},
                          "password": 'hubertnumbaone',
                          "password_confirmation": 'hubertnumbaone'
                        }

        end


      context 'successful' do
        it 'has successful response' do
          post "/api/v1/users", :params => @req_body

          expect(response).to be_successful
          expect(response).to have_http_status(201)
        end

        it 'returns formatted json' do
          post '/api/v1/users', :params => @req_body
          attributes = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
          expect(attributes.keys).to eq([:email, :api_key])
        end
      end
    end
end
