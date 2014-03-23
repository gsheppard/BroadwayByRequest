FactoryGirl.define do
  factory :song do
    sequence(:name) { |n| "Song #{n} Number"}
    association :musical
  end
end
