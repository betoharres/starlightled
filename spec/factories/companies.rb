FactoryGirl.define do
  factory :company do
    name "MyString"
    cnpj "MyString"
    address "MyString"
    phone "MyString"
    email { Faker::Internet.email }
    user
  end

end
