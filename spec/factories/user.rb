FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    cpf { Faker::IDNumber.brazilian_cpf }
    password { 'password' }
    password_confirmation { 'password' }

    state
    city
  end
end
