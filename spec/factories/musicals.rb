FactoryGirl.define do
  factory :musical do
    sequence(:name) { |n| "Musical number #{n} Word" }
    year '2000'
  end
end
