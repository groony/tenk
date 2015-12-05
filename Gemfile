source 'https://rubygems.org'
gem 'rails', '4.2.4'

# Persistence
gem 'pg'

# Scheduling and background jobs
gem 'sidekiq'
gem 'sidekiq-failures'
gem 'sinatra', require: false
gem 'whenever', require: false

gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'bootstrap-will_paginate'
gem 'slim-rails'
gem 'figaro'
gem 'ten_thousand_feet'
gem 'active_interaction', '~> 2.1'

group :development do
  # Annotate models
  gem 'annotate'

  # Code styling
  gem 'rubocop', require: false

  # Guards
  gem 'guard', require: false
  gem 'guard-annotate', require: false
  gem 'guard-rubocop', require: false
  gem 'guard-bundler', require: false
  gem 'guard-rspec', require: false
  gem 'guard-rails', require: false

  gem 'rspec-rails'

  gem 'snp-best-practices', git: 'git@git.snpdev.ru:saltpepper/snp-best-practices.git'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :production do
  gem 'puma'
end
