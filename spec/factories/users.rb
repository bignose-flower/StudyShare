FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 8)
    name {Faker::Name.name}
    birth_date {Faker::Date.birthday(min_age: 15, max_age: 65)}
    job {"高校生"}
    email {Faker::Internet.free_email}
    password {password}
    password_confirmation {password}
    image {File.open("#{Rails.root}/public/images/test_image.jpg")}
    notice {"true"}
  end
end