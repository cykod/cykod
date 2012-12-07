source 'https://rubygems.org'

ruby "1.9.3"

gem 'rails',     github: 'rails/rails'
gem 'journey',   github: 'rails/journey'
gem 'arel'
gem 'activerecord-deprecated_finders', github: 'rails/activerecord-deprecated_finders'

gem "turbolinks"

gem "haml"
gem "normalize-rails"


gem 'mongoid', github: 'mongoid/mongoid', branch: '4.0.0-dev'
gem 'devise'
gem 'formtastic'

# Gems used only for assets and not required
# # in production environments by default.
 group :assets do
   gem 'sprockets-rails'
   gem 'sass-rails', :git => 'git://github.com/rails/sass-rails.git'
   gem 'coffee-rails', :git => 'git://github.com/rails/coffee-rails.git'

   # See https://github.com/sstephenson/execjs#readme for more supported runtimes
   # gem 'therubyracer', platforms: :ruby

   gem 'uglifier', '>= 1.0.3'
 end

group :development, :test do
  gem 'mongoid-rspec'
  gem 'database_cleaner'
  gem "simplecov"
  gem "factory_girl"

  gem "rspec-rails",        :git => "git://github.com/rspec/rspec-rails.git"
  gem "rspec",              :git => "git://github.com/rspec/rspec.git"
  gem "rspec-core",         :git => "git://github.com/rspec/rspec-core.git"
  gem "rspec-expectations", :git => "git://github.com/rspec/rspec-expectations.git"
  gem "rspec-mocks",        :git => "git://github.com/rspec/rspec-mocks.git"
end

 gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
