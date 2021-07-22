FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end

  factory :charge do
    association :customer
    amount { Faker::Commerce.price * 100 }
    created { Faker::Time.backward(days: 10).to_i }
    currency { 'usd' }

    trait :paid do
      paid { true }
      refunded { false }
    end

    trait :failed do
      paid { false }
      refunded { false }
    end

    trait :refunded do
      paid { true }
      refunded { true }
    end
  end
end
