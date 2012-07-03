source 'https://rubygems.org'

gem 'chosen-rails'
gem 'geocoder'
gem 'jquery-rails'
gem 'mechanize'
gem 'nestling'
gem 'nokogiri'
gem 'omniauth'
gem 'omniauth-linkedin'
gem 'rails', '3.2.3'
gem 'rdio_api', git: 'https://github.com/anilv/rdio_api.git'

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'simplecov', :require => false
  gem 'sqlite3'
end

group :test do
  gem 'cane', :git => "git://github.com/square/cane.git"
  gem 'capybara'
  gem 'faker'
  gem 'growl'
  gem 'guard-rspec'
  gem 'launchy'
  gem 'reek', :git => "git://github.com/mvz/reek.git", :branch => "ripper_ruby_parser-2"
end