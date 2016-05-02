FactoryGirl.define do
  factory :control do
    space
    control_type
    name 'Electricity socket'
    uuid '123123123123123'
    state true
    status :healthy
  end
end