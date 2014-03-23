FactoryGirl.define do
  factory :cast do
    association :set_list
    association :actor
  end
end
