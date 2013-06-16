FactoryGirl.define do
  factory :news do
    title "My first news!"
    url "http://google.com/news"
    domain "google.com"
    content ""
    user_id 1
  end
end
