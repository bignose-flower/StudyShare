FactoryBot.define do
  factory :question do
    title {Faker::Name.name}
    question {Faker::Lorem.sentence}
    user
    after(:build) do |item|
      parent = create(:subject, category: "親", parent_id: nil)
      child = create(:subject, category: "子", parent_id: parent.id)
      grand_child = create(:subject, category: "孫", parent_id: child.id)
      item.subject_id = grand_child.id
    end
  end
end