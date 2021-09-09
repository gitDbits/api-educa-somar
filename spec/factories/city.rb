FactoryBot.define do
  factory :city do
    name { Faker::Address.city}
    capital { false }
    
    state
  end
  
  trait :city do
    capital { false }
  end
  
  trait :capital do
    capital { true }
  end
end
