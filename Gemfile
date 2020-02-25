source "http://rubygems.org"

gem "rails", "4.2.5"
gem "sprockets", "2.12.3" # Latest version of sprockets 2.*. 3.* causes a failure at startup
gem "mysql2"
gem "icu_tournament"
gem "icu_utils", "1.3.1", git: 'https://github.com/ninkibah/icu_utils.git'
gem "icu_ratings"
gem "icu_name"
gem "whenever", :require => false
gem "redcarpet"
gem "nokogiri"
gem "cancan", "~> 1.6"
gem "jquery-rails", ">= 4.0.3"
gem "jquery-ui-rails", ">= 5.0.3"
gem "rack-mini-profiler"
gem "haml-rails", ">= 0.8.2"
gem "sass-rails", "~> 5.0", ">= 5.0.1"
gem "coffee-rails", "~> 4.1.0"
gem "therubyracer", platforms: :ruby
gem "uglifier"

group :development do
  gem "capistrano-rails", "~> 1.1", ">= 1.1.2"
  gem "wirble"
end

group :test, :development do
  gem "rspec-rails", ">= 3.2.1"
  gem "capybara"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
  gem "launchy"
  gem "factory_girl_rails", ">= 4.5.0"
  gem "faker"
  gem "database_cleaner"
  #gem "byebug"
end
