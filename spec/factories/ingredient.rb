FactoryBot.define do
  factory :ingredient do
    name { Faker::Lorem.characters(number:5) }
    amount { "2個" }
  end
end