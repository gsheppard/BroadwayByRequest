FactoryGirl.define do
  factory :actor do
    first_name 'Banana'
    last_name 'Jefferson'
    sequence(:email) { |n| "emai#{n}l@example.com"}
    phone '1111111111'

    factory :actor_with_performance do
      after(:create) do |actor|
        FactoryGirl.create(:cast, actor: actor)
      end
    end
  end
end
