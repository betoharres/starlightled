FactoryGirl.define do
  factory :task do
    execute_at 1.day.ago.utc.to_s
    code 100
    attachable_id 1
    attachable_type 'ConfigFile'
    aasm_state "waiting"
    node
  end
end
