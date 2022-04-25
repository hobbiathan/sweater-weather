require 'rails_helper'

RSpec.describe 'Forecast API', type: :request do


  describe 'GET /forecast?location' do
    before { get '/api/v1/forecast?location=detroit' }

    it 'returns properly formatted JSON data' do
      JSON.parse(response.body, symbolize_names: true)[:data]
      expect(data.keys).to eq([:id, :type, :attributes])
    end

    it 'returns status code 200, success' do
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'contains respective attribute keys and values' do
       attributes = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
       expect(attributes.keys).to eq([:current_weather, :daily_weather, :hourly_weather])
    end

    it ':current_weather contains appropriate keys' do
      expected_keys = [:datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon]
      current_weather = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:current_weather]
      expect(current_weather.keys).to eq(expected_keys)
    end

    it ':daily_weather contains appropriate keys' do
      expected_keys = [:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon]
      daily_weather = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:daily_weather]
      expect(daily_weather.keys).to eq(expected_keys)
    end

    it ':hourly_weather contains appropriate keys' do
      expected_keys = [:time, :temperature, :conditions, :icon]
      hourly_weather = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:hourly_weather]
      expect(hourly_weather.keys).to eq(expected_keys)
    end

  end

  context 'location does not exist' do
    before { get '/api/v1/forecast?location' }

    it 'returns 400' do
      expect(response).to have_http_status(400)
    end

    it 'renders custom error json' do
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:error]).to eq({:message=>"invalid parameters - no location provided"})
    end
  end

end
