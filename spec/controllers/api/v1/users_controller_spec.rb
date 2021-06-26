require 'rails_helper'
require 'jwt'

RSpec.describe Api::V1::UsersController, type: :controller do
  
  describe 'before_actions' do
    before do 
      token = JWT.encode({user: User.first.id}, 
         ENV["AUTH_SECRET"], "HS256")
       header "Authorization", "Bearer #{token}"
       get "/api/v1/users"
    end

    it 'responds with a 404 status' do 
      expect(last_response.status).to eq 404
    end
  end
end