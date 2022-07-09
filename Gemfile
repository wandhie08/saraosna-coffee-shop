source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.8'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'awesome_print'
gem 'active_link_to'
gem 'bootstrap', '~> 4.3.1'
gem 'by_star', git: "git://github.com/radar/by_star"
gem 'carrierwave', '~> 2.0'
gem "counter_culture", "~> 2.1"
gem 'daemons'
gem 'data-confirm-modal'
gem 'database_cleaner'
gem 'devise'
gem 'dotenv'
gem 'dotenv-rails'
gem 'delayed_job_active_record'
gem "delayed_job_web"
gem 'faker'
gem 'fast_jsonapi'
gem 'font-awesome-sass', '~> 5.6', '>= 5.6.1'
gem 'friendly_id', '~> 5.2.4'
gem 'httparty'
gem 'jquery'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'jquery-datatables'
gem 'meta-tags'
gem 'momentjs-rails'
gem 'nprogress-rails'
gem 'pagy'
gem 'popper_js', '~> 1.14.5'
gem 'ransack'
gem 'rack-cors'
gem 'react-rails'
gem 'redis'
gem 'redis-rails'
gem 'redis-namespace'
gem 'redis-objects'
gem 'hiredis'
gem 'serviceworker-rails'
gem 'simple_form'
gem 'slim-rails'

gem 'phonelib'
# gem 'webpacker', '~> 4.x'
gem 'exception_notification'

gem 'tts'
gem 'espeak-ruby'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'pry-byebug'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'annotate'
  # Use Capistrano for deployment
  gem 'capistrano',               require: false
  gem 'capistrano-rvm',           require: false
  gem 'capistrano-rails',         require: false
  gem 'capistrano-bundler',       require: false
  gem 'capistrano3-puma',         require: false
  gem 'capistrano-rails-console', require: false
  gem 'capistrano-rails-db'
  gem 'capistrano3-delayed-job', '~> 1.0'
  # gem 'capistrano-yarn'
  gem 'capistrano-linked-files'
  gem 'ed25519', '>= 1.2', '< 2.0'
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
