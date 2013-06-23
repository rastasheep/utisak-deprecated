ruby '1.9.3'
source "http://rubygems.org"

gem "rails"

gem "pg", :require => "pg"

gem "devise"
gem "omniauth-facebook"
gem 'bcrypt-ruby'              # password encryption

gem 'inherited_resources'      # for easy RESTful API controller scaffolding
gem 'active_model_serializers' # works out of the box with ember-data

# gem 'ember-rails'              # ember framework
# gem 'ember-auth-rails'3
# gem 'ember-auth-source'

gem "meta_search"
gem "dynamic_form"
gem "heroku"
gem "ancestry"
gem "kaminari"

gem "chartkick"
gem "groupdate"

gem "jquery-rails"
gem "turbolinks"
gem "redcarpet"

group :assets do
  gem "therubyracer", :platform => :ruby
  gem "sass-rails"
  gem "coffee-rails"
  gem "less-rails"
end

gem 'bootstrap-sass', '~> 2.3.2.0'

group :test, :development do
  gem "rspec-rails"
  gem "spork-rails"
  gem "debugger"
  gem "awesome_print"
end

group :development do
  gem "chronic"
  gem "admin_view"
  gem "debugger"
end

group :test do
  gem "factory_girl_rails"
  gem "cucumber-rails", :require => false
  gem "database_cleaner"
  gem "selenium-webdriver"
  gem "capybara"
  gem "shoulda"
  gem "email_spec"
end

group :production, :development do
  gem "thin"
end
