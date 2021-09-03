FactoryBot.define do
  factory :institution do
    cnpj { Faker::Number.number(digits: 14) }
    name { Faker::Name.first_name }
    email { Faker::Internet.safe_email }
    fantasy_name { Faker::Name.last_name }
    phone { Faker::PhoneNumber.phone_number }
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    neighborhood { Faker::Address.community }
    zip_code { Faker::Address.zip_code }
    uf { Faker::Address.state_abbr }

    trait :school do
      school { true }
      university { false }
    end

    trait :university do
      school { true }
      university { false }
    end
  end
end
