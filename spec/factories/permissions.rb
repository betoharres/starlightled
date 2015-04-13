FactoryGirl.define do
  factory :permission do
    ability 15
    role

    # User can manage every resource of the app if the ability gives him permission
    # Even the Role and Permission's resource can be manage by other User
    # e.g.: a manager
    trait :role do
      resource 'Role'
    end

    trait :permission do
      resource 'Permission'
    end

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
