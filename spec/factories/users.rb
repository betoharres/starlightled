FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password "password_encrypted"
    encrypted_password "password_encrypted"
  end
end
