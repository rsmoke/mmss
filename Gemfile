source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3.5'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
# gem 'sass-rails', '~> 5'
gem 'sassc', '~> 2.2', '>= 2.2.1'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
# gem 'webpacker', '~> 4.0'
gem 'webpacker', '~> 5.0', '>= 5.0.1'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

gem "devise", ">= 4.7.1"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'activeadmin'

# Add support for maintenance modes
gem 'turnout'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
gem "google-cloud-storage", require: false

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
gem 'country_select', '~> 4.0'
gem 'money-rails', '~>1.12'

# Rails app rake and capistrano tasks to create and restore dumps of database and assets.
gem 'dump'
# Phone number validation (yet to be implemented in this app)
# https://github.com/mobi/telephone_number
# gem 'telephone_number'

# FriendlyID slugs (yet to be implemented in this app)
# https://github.com/norman/friendly_id
# gem 'friendly_id', '~> 5.4.0'

gem 'newrelic_rpm'
gem 'newrelic-infinite_tracing'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-rails', '~> 0.3.9'
  gem 'pry-byebug', '~> 3.9'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
  gem 'factory_bot_rails', '~> 6.0'
  gem 'capybara'
  gem 'webdrivers'
  gem 'faker'

end

group :development do
  gem 'annotate'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem "better_errors"
  gem 'binding_of_caller', '~> 0.8.0'
  gem 'meta_request', '~> 0.7.2'

  gem 'letter_opener'
  gem 'letter_opener_web', '~> 1.3', '>= 1.3.1'

  gem 'capistrano', require: false
  gem 'capistrano3-puma'
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-postgresql'
  # gem 'capistrano-passenger', '~> 0.2.0'

end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
