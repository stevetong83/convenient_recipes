# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    user_id 1
    recipe_id 1
    photo "MyString"
  end
end
