require 'factory_girl'

FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.last_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password 'please'
  end

  factory :job do
    user 
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    start_at { Time.now + 1.month }
    location_name { "#{Faker::Address.city}, #{Faker::Address.country}" }
  end
end

