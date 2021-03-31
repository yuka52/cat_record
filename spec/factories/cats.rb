FactoryBot.define do
  factory :cat do
    name {Faker::Name.first_name}
    birthday {Faker::Date.between(from: '1985-01-01', to: Date.today)}
    favorite {'ねこじゃらし'}
    gender_id {Faker::Number.between(from: 2, to: 3)}
    association :user

    after(:build) do |cat|
      cat.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
