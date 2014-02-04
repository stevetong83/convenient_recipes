FactoryGirl.define do
  factory :user do
    name "Emma Tong"
    email {generate :email}
    password "password"
  end
end