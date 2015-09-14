FactoryGirl.define do
  factory :task do
    execute_at DateTime.now.utc.to_s
    code 100
    aasm_state "waiting"
    node
  end
end
