require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  it 'has a valid user' do
    expect(user).to be_valid
  end

  it 'with an invalid email address' do
    user.email = 'notvalid.email.com'

    expect(user).to_not be_valid
  end

  it 'with an invalid password' do
    user.password = '12345'

    expect(user).to_not be_valid
  end

  context 'validations attributes' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to validate_length_of :password }
  end
end
