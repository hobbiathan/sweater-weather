require 'rails_helper'

RSpec.describe 'Munchies API' do
  context 'valid query, highest level keys' do
    before { get "/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese" }

    it 'is returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'has appropriate json keys' do
      expect(json[:data].keys).to eq([:id, :type, :attributes])
    end

    it 'has appropriate attributes' do
      expect(json[:data][:attributes].keys).to eq([:destination_city, :travel_time, :forecast, :restaurant])
    end

    it 'has appropriate sub-keys FOR :forecast' do
      expect(json[:data][:attributes][:forecast].keys).to eq([:summary, :temperature])
    end

    it 'has appropriate sub-keys FOR :restaurant' do
      expect(json[:data][:attributes][:restaurant].keys).to eq([:name, :address])
    end
  end

  context 'missing queries' do

    it 'no start' do
      get "/api/v1/munchies?start=&destination=pueblo,co&food=chinese"
      expect(response).to have_http_status(400)
      expect(json[:error]).to eq({:message=>"invalid parameters - no start location provided"})
    end

    it 'no destination' do
      get "/api/v1/munchies?start=denver,co&destination=&food=chinese"
      expect(response).to have_http_status(400)
      expect(json[:error]).to eq({:message=>"invalid parameters - no destination location provided"})
    end

    it 'no food' do
      get "/api/v1/munchies?start=denver,co&destination=pueblo,co&food="
      expect(response).to have_http_status(400)
      expect(json[:error]).to eq({:message=>"invalid parameters - no food provided"})
    end

  end

end
