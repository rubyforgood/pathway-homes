FactoryGirl.define do
  factory :request_type do
    category "Appliance Repair"
    sequence(:request) { |n| "Request #{n}" }
  end
end
