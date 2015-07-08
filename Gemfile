source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'

gem 'pg'
# gem 'thin'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library (requested from bower)
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]
gem 'validates_formatting_of'
gem 'simple_form'
gem 'binding_of_caller'
gem 'bootstrap-sass', github: 'twbs/bootstrap-sass'
gem 'bootstrap-sass-extras'
gem 'rails_config'
gem 'devise', github: 'plataformatec/devise'
gem 'faker'
gem "audited-activerecord", "~> 4.0"
gem 'dotenv-rails'
gem "bower-rails", "~> 0.9.2"
gem 'bootstrap-glyphicons'
gem 'chosen-rails'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'railroady'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'rspec-nc'
end

group :test do
  gem 'shoulda-matchers'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
end

group :development do
  gem 'better_errors'
  gem 'pry-rails'
end

group :production do
  gem 'puma'
  gem 'rails_12factor'
end
