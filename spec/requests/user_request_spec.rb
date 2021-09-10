require 'rails_helper'

include ApiSpecHelper

RSpec.describe 'User', type: :request do
  let(:user) { create(:user) }
  let(:user_id) { user.id }
  let(:token) { login user: { email: user.email, password: 'password' } }
  let(:users) { create_list(:user, 5) }
  let(:auth_token) { { 'Authorization': token.to_s } }
  let(:valid_attributes) {
    { 
      email: Faker::Internet.email,
      cpf: Faker::IDNumber.brazilian_cpf,
      state_id: user.state.id,
      city_id: user.city.id, 
      password: 'password',
      password_confirmation: 'password'
    } 
  }

  describe 'INDEX users' do
    it 'list users' do
      get '/api/v1/users', headers: auth_token
      expect(response).to have_http_status(:ok)
      expect(users.size).to eq(5)
    end
  end

  describe 'SHOW user' do
    it 'find user' do
      get "/api/v1/users/#{user_id}", headers: auth_token
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq(user.to_json)
    end
  end

  describe 'CREATE user' do
    it 'basic user' do
      post '/api/v1/users', headers: auth_token, params: valid_attributes

      expect(response).to have_http_status(:created)
      expect(response.body).not_to eq([])
    end
  end


  describe 'UPDATE users' do
    context 'when user exist' do
      it 'updated user' do
        put "/api/v1/users/#{user_id}", headers: auth_token, params: valid_attributes
        expect(response).to have_http_status(204)
      end
    end
  end
end
