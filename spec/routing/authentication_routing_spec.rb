require 'rails_helper'

RSpec.describe Api::V1::AuthenticationController, type: :routing do
  describe 'authentication routing' do
    it 'routes to api/v1/auth to user_token#create' do
      expect(post: 'api/v1/auth/login').to route_to('api/v1/authentication#login')
    end
  end
end
