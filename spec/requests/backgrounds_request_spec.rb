require 'rails_helper'

RSpec.describe 'Backgrounds API' do
  context 'backgrounds#index' do
    before { get '/api/v1/backgrounds?location=detroit' }

    it 'has successful response' do
      expect(response).to have_http_status(200)
    end

    it 'returns properly formatted json' do
      expect(json[:data].keys).to eq([:id, :type, :attributes])
    end

    it 'contains proper attributes' do
      expect(json[:data][:attributes].keys).to eq([:id, :source, :image_url, :photographer, :profile])
    end
  end

  context 'background has no location' do
    before { get '/api/v1/backgrounds?location' }

    it 'returns 400' do
      expect(response).to have_http_status(400)
    end
  end
end
