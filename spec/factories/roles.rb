FactoryGirl.define do
  factory :role do
    user

    trait :admin do
      name 'Admin'
    end

    trait :director do
      name 'Director'
    end

    trait :operator do
      name 'Operator'
    end

    trait :gateway do
      name 'Gateway'
    end

    trait :employee do
      name 'employee'
    end

  end

end
