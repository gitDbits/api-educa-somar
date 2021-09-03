require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  describe 'POST /auth/login' do
    let(:user) { FactoryBot.create(:user) }

    it 'authenticate the user' do
      post '/api/v1/auth/login', params: { email: user.email, password: 'password' }
      expect(response).to have_http_status(:ok)
      expect(response.body).not_to be_empty
    end

    it 'returns error when email does not exist' do
      post '/api/v1/auth/login', params: { email: 'ac', password: 'password' }
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns error when password is incorrect' do
      post '/api/v1/auth/login', params: { email: user.email, password: 'incorrect' }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
