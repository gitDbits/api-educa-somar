FactoryBot.define do
  factory :institution do
    cnpj { "MyString" }
    name { "MyString" }
    email { "MyString" }
    fantasy_name { "MyString" }
    phone { "MyString" }
    street { "MyString" }
    number { "MyString" }
    neighborhood { "MyString" }
    zip_code { "MyString" }
    university { false }
    school { false }
    uf { "MyString" }
  end
end
