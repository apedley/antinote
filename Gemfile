ruby '2.0.0'
source 'https://rubygems.org'

gem 'rails', '4.0.0.rc2'

gem 'sass-rails', '~> 4.0.0.rc1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'haml-rails'
gem 'foreman'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.0.1'
gem 'redcarpet'
gem 'pygments.rb'

gem 'simple_form'
gem 'bcrypt-ruby'
gem 'nokogiri'
gem 'rabl'
gem 'oj'
gem 'unicorn'

group :doc do
  gem 'sdoc', require: false
end

group :development do
  gem 'meta_request'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'thin'
  gem 'rack-livereload'
  gem 'guard'
  gem 'guard-livereload'
end

group :test do
  gem 'factory_girl'
  gem 'factory_girl_rails'
  
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'libnotify'
end

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails' 
  gem 'sqlite3'
  gem 'guard-rspec'
  gem 'spork-rails', github: 'railstutorial/spork-rails'
  gem 'guard-spork'
  gem 'childprocess'
end

group :production do
  gem 'pg'
end