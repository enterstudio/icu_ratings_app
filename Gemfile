source "http://rubygems.org"

gem "rails", "5.0.0"
gem "sprockets", "3.3.5" # Latest version of sprockets 2.*. 3.* causes a failure at startup
gem "mysql2"
gem "icu_tournament"
gem "icu_utils", "1.3.1", git: 'https://github.com/ninkibah/icu_utils.git'
gem "icu_ratings"
gem "icu_name"
gem "whenever", :require => false
gem "redcarpet"
gem "nokogiri", ">= 1.10.5"
gem "cancan", "~> 1.6"
gem "jquery-rails"
gem "jquery-ui-rails"
gem "rack-mini-profiler"
gem "haml-rails"
gem "sass-rails", "~> 5.0", ">= 5.0.5"
gem "coffee-rails", "~> 4.1.1"
gem "therubyracer", platforms: :ruby
gem "uglifier"

group :development do
  gem "capistrano-rails", "~> 1.1"
  gem "wirble"
end

group :test, :development do
  gem "rspec-rails", ">= 3.5.0"
  gem "capybara"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
  gem "launchy"
  gem "factory_girl_rails"
  gem "faker"
  gem "database_cleaner"
  #gem "byebug"
end
