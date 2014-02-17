# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    user_id 1
    review "MyText"
    rating 1
    recipe_id 1
  end
end
