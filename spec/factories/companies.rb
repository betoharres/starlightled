FactoryGirl.define do
  factory :company do
    name "MyString"
    cnpj "MyString"
    company_key 'Ash333'
    address "MyString"
    phone "MyString"
    email { Faker::Internet.email }
    user
  end

end
