require 'rails_helper'

include ApiSpecHelper

RSpec.describe 'Region', type: :request do 
  let(:region) { create(:region) }
  let(:region_id) { region.id  }
  let(:regions) { create_list(:region, 5) }
  let(:user) { create(:user) }
  let(:token) { login user: { email: user.email, password: 'password' } }
  let(:auth_token) { { 'Authorization': token.to_s } }
  let(:valid_attributes) { { name: Faker::Name::first_name } }

  describe "INDEX regions" do
    it 'list regions' do
      get '/api/v1/regions', headers: auth_token
      expect(response).to  have_http_status(200)
      expect(regions.size).to eq(5)
    end
  end

  describe "SHOW region" do
    it 'find region' do
      get "/api/v1/regions/#{region_id}", headers: auth_token
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq(region.to_json)
    end
  end

  describe "CREATE region" do
    it 'created insititution' do
      post '/api/v1/regions', headers: auth_token, params: { region: valid_attributes }
      expect(response).to have_http_status(:created)
    end
  end

  describe "UPDATE regions" do
    it 'updated region' do
      put "/api/v1/regions/#{region_id}", headers: auth_token, params: { region: valid_attributes }
      expect(response).to have_http_status(200)
    end
  end
end
