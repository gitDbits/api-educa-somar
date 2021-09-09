FactoryBot.define do
  factory :region do
    name { Faker::Name.first_name }
  end
end
