FactoryBot.define do
  factory :answer do
    answer {Faker::Lorem.sentence}
    question
    user
  end
end