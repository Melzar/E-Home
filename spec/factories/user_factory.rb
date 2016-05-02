FactoryGirl.define do
    factory :user do
      role
      sequence(:email) { |n| "user#{n}@example.com"}
      password '12345678'
    end
end