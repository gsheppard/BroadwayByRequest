FactoryGirl.define do
  factory :set_list do
    association :song
    association :performance
  end
end
