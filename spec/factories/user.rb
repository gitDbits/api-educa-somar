FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    cpf { Faker::IDNumber.brazilian_cpf }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) } 
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    neighborhood { Faker::Address.community }
    zip_code { Faker::Address.postcode }
    password { 'password' }
    password_confirmation { 'password' }
    active { true }
    approved { false }
    admin { false }
    student { false }
    teacher { false }
    
    state
    city

    trait:admin do 
      admin { true }
    end

    trait:student do 
      student { true }
    end

    trait:teacher do 
      teacher { true }
    end
  end
end
