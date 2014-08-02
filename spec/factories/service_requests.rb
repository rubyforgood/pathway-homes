FactoryGirl.define do
  factory :service_request do
    community_name { "Paragon Homes" }
    apt_number { "100" }
    work_desc { "Need my AC fixed" }
    special_instructions { "Foo bar baz" }
    alarm { true }
    community_street_address { "1234 Paragon Street" }
    community_zip_code { "20001" }
    pet { false }
    authorized_to_enter { true }
  end

  trait :open do
    status { "open" }
  end

  trait :in_progress do
    status { "in_progress" }
  end
end
