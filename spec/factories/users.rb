FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@example.com" }
    password { SecureRandom.hex(10) }
  end

  trait :admin do
    role "admin"
  end
end
