FactoryGirl.define do
  factory :customer do
    user
    first_name 'Test_name'
    last_name 'Test_last_name'
    phone_number '111-111-111'
    address_1 'Test Address 1'
    address_2 'Test 31'
    city 'Test city'
    zip '1231313'
  end
end