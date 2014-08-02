FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@example.com" }
    password { SecureRandom.hex(10) }
    password_updated_at { Time.now }
  end

  trait :admin do
    role "admin"
  end

  trait :maintenance do
    role "maintenance"
  end
end
