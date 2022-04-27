require 'rails_helper'

RSpec.describe 'Users API', type: :request do

    describe 'POST  /api/v1/users' do
      before(:each) do

         @req_body = {
                          "email": "hubert@test.com",
                          "password": "hubertnumbaone",
                          "password_confirmation": "hubertnumbaone"
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
          expect(json[:data].keys).to eq([:id, :type, :attributes])
        end

        it 'has proper attribute keys' do
          post '/api/v1/users', :params => @req_body
          expect(json[:data][:attributes].keys).to eq([:email, :api_key])
        end
      end

      context 'unsuccesful' do
        before(:each) do
          @bad_req = {
                           "email": "hubert@test.com",
                           "password": "hubertnumbaone",
                           "password_confirmation": "hubertnumbasdgasdg"
                         }
        end

        it 'has failed response' do
          post "/api/v1/users", :params => @bad_req

          expect(response).to_not be_successful
          expect(response).to have_http_status(400)
        end

        it 'gives proper response body for password' do
          post "/api/v1/users", :params => @bad_req
          expect(json[:error]).to eq({:message=>"password and confirmation do not match"})
        end
      end

      context 'unsuccessful - email exists' do
        before(:each) do
          User.create!(email: 'hubert@gmail.com', password: 'passwor', password_confirmation: 'passwor')
          @bad_req = {
                           "email": 'hubert@gmail.com',
                           "password": 'hubertnumbaone',
                           "password_confirmation": 'hubertnumbaone'

                         }
        end

        it 'has failed response' do
          post "/api/v1/users", :params => @bad_req

          expect(response).to_not be_successful
          expect(response).to have_http_status(400)
        end

        it 'gives proper response body for password' do
          post "/api/v1/users", :params => @bad_req
          expect(json[:error]).to eq({:message=>"email already registered"})
        end
      end
    end
end
