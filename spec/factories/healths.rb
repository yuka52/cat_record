FactoryBot.define do
  factory :health do
    recorded_date {Faker::Date.between(from: 7.days.ago, to: Date.today)}
    food_id {Faker::Number.between(from: 2, to: 5)}
    tulle_id {Faker::Number.between(from: 2, to: 5)}
    play_id {Faker::Number.between(from: 2, to: 6)}
    weight {Faker::Number.between(from: 3.0, to: 4.0)}
    poop_id {Faker::Number.between(from: 2, to: 5)}
    pee_id {Faker::Number.between(from: 2, to: 5)}
    comment {Faker::Lorem.sentence}
    association :cat
    association :user
  end
end
