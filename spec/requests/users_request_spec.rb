require 'rails_helper'


RSpec.describe 'Authentications', type: :authenticaton_controller do
  let(:current_user) { FactoryBot.create(:user) }

  describe '#create' do
    it 'responds with a JWT' do
      post login, params: {email: current_user.email, password: current_user.password}
      token = JSON.parse(response.body)['token']

      expect(token).to be_kind_of(String)
      segments = token.split('.')
      expect(segments.size).to eql(3)
    end
  end
end
