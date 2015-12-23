source "https://rubygems.org"

# ruby "2.1.6"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "4.2.4"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.1.0"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "therubyracer", platforms: :ruby

# Use jquery as the JavaScript library
gem "jquery-rails"
# Turbolinks makes following links in your web application faster. Read more:
# https://github.com/rails/turbolinks
gem "turbolinks"
gem "jquery-turbolinks"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.0"
# bundle exec rake doc:rails generates the API under doc/api.
gem "sdoc", "~> 0.4.0", group: :doc

# Use materialize css
gem "materialize-sass"
# Use font awesome
gem "font-awesome-sass"

gem "faker"

# Use ActiveModel has_secure_password
gem "bcrypt", "~> 3.1.7"

gem "will_paginate", "~> 3.0.6"

gem "coveralls", require: false

# Use Unicorn as the app server
# gem "unicorn"

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger
  # console
  gem "byebug"
  # Use sqlite3 as the database for Active Record
  gem "sqlite3"
  gem "rspec-rails", "~> 3.0"
  gem "capybara"
  gem "factory_girl_rails"
  gem "shoulda-matchers", "~> 3.0.1"
  gem "letter_opener"
  gem "pry-rails"
  gem "database_cleaner"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem "web-console", "~> 2.0"
  gem "rubocop", require: false
  gem "scss_lint", require: false
  gem "guard", require: false
  gem "guard-livereload", "~> 2.5", require: false
  gem "guard-rspec", require: false
end

group :production do
  gem "pg"
  gem "rails_12factor"
  # Use Puma webserver
  gem "puma"
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
