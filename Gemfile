source "http://rubygems.org"

gem "rails", "6.1.7.3"
gem "sprockets", "4.2.0" # Latest version of sprockets 2.*. 3.* causes a failure at startup
gem "mysql2"
gem "icu_tournament"
gem "icu_utils", "1.3.1", git: 'https://github.com/ninkibah/icu_utils.git'
gem "icu_ratings"
gem "icu_name"
gem "whenever", :require => false
gem "redcarpet", ">= 3.5.1"
gem "nokogiri", ">= 1.13.9"
gem "cancan", "~> 1.6"
gem "jquery-rails", ">= 4.4.0"
gem "jquery-ui-rails", ">= 6.0.0"
gem "rack-mini-profiler", ">= 0.10.1"
gem "haml-rails", ">= 1.0.0"
gem "sass-rails", "~> 6.0", ">= 6.0.0"
gem "coffee-rails", "~> 4.2.2"
gem "therubyracer", platforms: :ruby
gem "uglifier", ">= 2.7.2"

group :development do
  gem "capistrano-rails", "~> 1.1", ">= 1.1.2"
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
