FactoryGirl.define do
  factory :permission do
    ability 1
    role

    trait :user do
      resource 'User'
    end

    trait :company do
      resource 'Company'
    end

    trait :network do
      resource 'Network'
    end

    trait :node do
      resource 'Node'
    end

    trait :product do
      resource 'Product'
    end

    trait :lamp do
      resource 'Lamp'
    end

    trait :gateway do
      resource 'Gateway'
    end

  end

end
