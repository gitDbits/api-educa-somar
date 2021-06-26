require 'rails_helper'

RSpec.describe  Api::V1::AuthenticationController, type: :routing do
  describe 'authenticate login' do
    it 'routes to /v1/auth login create token' do 
      expect(:post => 'api/v1/auth/login').to route_to('api/v1/authentication#login')
    end
  end
end