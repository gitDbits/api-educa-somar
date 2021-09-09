require 'rails_helper'

include ApiSpecHelper

RSpec.describe 'City', type: :request do 
  let(:city) { create(:city) }
  let(:city_id) { city.id }
  let(:cities) { create_list(:city, 5) }
  let(:user) { create(:user) }
  let(:token) { login user: { email: user.email, password: 'password' } }
  let(:auth_token) { { 'Authorization': token.to_s } }
  let(:valid_attributes) { { name: Faker::Name::first_name, capital: true, state_id: city.state.id } }

  describe "INDEX cities" do
    it 'list cities' do
      get "/api/v1/cities/capital", headers: auth_token
      expect(response).to  have_http_status(200)
      expect(cities.size).to eq(5)
    end
  end

  describe "INDEX cities by CAPITAL" do
    it 'list cities' do
      get '/api/v1/cities', headers: auth_token
      expect(response).to  have_http_status(200)
    end
  end

  describe "SHOW city" do
    it 'find city' do
      get "/api/v1/cities/#{city_id}", headers: auth_token
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq(city.to_json)
    end
  end
end
