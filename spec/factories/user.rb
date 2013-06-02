FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "john#{n}@doe.com" }
    username "test_user"
    password "password"
    password_confirmation "password"
  end
end
