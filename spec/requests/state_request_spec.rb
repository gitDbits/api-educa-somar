require 'rails_helper'

include ApiSpecHelper

RSpec.describe 'State', type: :request do 
  let(:state) { create(:state) }
  let(:state_acronym) { state.acronym.downcase }
  let(:states) { create_list(:state, 5) }
  let(:user) { create(:user) }
  let(:token) { login user: { email: user.email, password: 'password' } }
  let(:auth_token) { { 'Authorization': token.to_s } }
  let(:valid_attributes) { { name: Faker::Name::first_name, acronym: Faker::Name::last_name, region_id: state.region.id } }

  describe "INDEX states" do
    it 'list states' do
      get '/api/v1/states', headers: auth_token
      expect(response).to  have_http_status(200)
      expect(states.size).to eq(5)
    end
  end

  describe "INDEX cites by_state" do
    it 'list states' do
      get "/api/v1/states/#{state_acronym}/cities", headers: auth_token
      expect(response).to  have_http_status(200)
    end
  end

  describe "SHOW state" do
    it 'find state' do
      get "/api/v1/states/#{state_acronym}", headers: auth_token
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq(state.to_json)
    end
  end
end
