FactoryBot.define do
  factory :procedure do
    body { Faker::Lorem.characters(number:15) }
  end
end