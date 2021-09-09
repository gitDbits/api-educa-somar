require 'rails_helper'

include ApiSpecHelper

RSpec.describe 'Institution', type: :request do 
  let(:institution) { create(:institution) }
  let(:institution_id) { institution.id  }
  let(:institutions) { create_list(:institution, 5) }
  let(:user) { create(:user) }
  let(:token) { login user: { email: user.email, password: 'password' } }
  let(:auth_token) { { 'Authorization': token.to_s } }
  let(:valid_attributes) { { cnpj: Faker::Number.number(digits: 14), name: Faker::Name.first_name, fantasy_name: Faker::Name.last_name, email: Faker::Internet.safe_email, phone: Faker::PhoneNumber.phone_number } }

  describe "INDEX institutions" do
    it 'list institutions' do
      get '/api/v1/institutions', headers: auth_token
      expect(response).to  have_http_status(200)
      expect(institutions.size).to eq(5)
    end
  end

  describe "SHOW institution" do
    it 'find institution' do
      get "/api/v1/institutions/#{institution_id}", headers: auth_token
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq(institution.to_json)
    end
  end

  describe "CREATE institution" do
    it 'created insititution' do
      post '/api/v1/institutions', headers: auth_token, params: { institution: valid_attributes }
      expect(response).to have_http_status(:created)
    end
  end

  describe "UPDATE institutions" do
    it 'updated institution' do
      put "/api/v1/institutions/#{institution_id}", headers: auth_token, params: { institution: valid_attributes }
      expect(response).to have_http_status(200)
    end
  end
end
