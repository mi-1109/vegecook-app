FactoryBot.define do
  factory :post_recipe do
    title { "テストのレシピ" }
    introduction { Faker::Lorem.characters(number: 15) }
    serving { "2" }
    veg_type { 3 }
    recipe_image_id { "f5b971b26818fb2573437df98e08cfaffe88786348bf28bd120f9fb5df5e" }
    user_id { 1 }
  end
end
