FactoryGirl.define do
  factory :gateway do
    email 'a@a.com'
    password 12345678
    password_confirmation 12345678
    uid 'a@a.com'
    provider 'email'
    ip "179.178.23.2"
    url_connection "http://localhost"
    product
  end

end
