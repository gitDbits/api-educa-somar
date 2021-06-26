require 'rails_helper'

RSpec.describe User, type: :model do

  it 'created user' do
    expect(FactoryBot.create(:user)).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to allow_value("contato@educasomar.com.br").for(:email) }
    it { is_expected.to validate_presence_of :password }
  end
end
