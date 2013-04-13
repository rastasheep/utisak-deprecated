FactoryGirl.define do
  factory :news do
    title "My first news."
    url "http://google.com"
    domain "google.com"
    points 100
    content ""
  end
end
