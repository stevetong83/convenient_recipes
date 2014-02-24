# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :grocery_list_ingredient do
    user_id 1
    ingredient "MyString"
  end
end
