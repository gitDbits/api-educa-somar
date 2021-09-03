require 'rails_helper'

RSpec.describe Institution, type: :model do
  let(:school) { FactoryBot.create(:institution, :school) }
  let(:university) { FactoryBot.create(:institution, :university) }

  it 'has a valid school' do
    expect(school).to be_valid
  end

  it 'has a valid university' do
    expect(university).to be_valid
  end

  it 'with an invalid email address' do
    school.email = 'notvalid.email.com'

    expect(school).to_not be_valid
  end

  it 'with an invalid email address' do
    university.email = 'notvalid.email.com'

    expect(university).to_not be_valid
  end

  context 'validations attributes' do
    it { is_expected.to validate_presence_of :cnpj }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :fantasy_name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :phone }
    it { is_expected.to validate_uniqueness_of :cnpj }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_uniqueness_of :fantasy_name }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to validate_uniqueness_of :phone }
  end
end
