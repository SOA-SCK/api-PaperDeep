# frozen_string_literal: true

source 'https://rubygems.org'
ruby File.read('.ruby-version').strip

# Configuration and Utilities
gem 'figaro', '~> 1.2'
gem 'rack-test', '~> 1.1.0' # for testing and can also be used to diagnose in production
gem 'rake'

# PRESENTATION LAYER
gem 'multi_json', '~> 1.15'
gem 'roar', '~> 1.1'

# Web Application
gem 'puma', '~> 5.5'
gem 'rack', '~> 2' # 2.3 will fix delegateclass bug
gem 'rack-cors'
gem 'roda', '~> 3.49'
gem 'slim', '~> 4.1'

# Controllers and services
gem 'dry-monads', '~> 1.4'
gem 'dry-transaction', '~> 0.13'
gem 'dry-validation', '~> 1.7'

# Validation
gem 'dry-struct', '~> 1.4'
gem 'dry-types', '~> 1.5'

# Networking
gem 'http', '~> 5.0'

# Caching
gem 'rack-cache', '~> 1.13'
gem 'redis', '~> 4.5'
gem 'redis-rack-cache', '~> 2.2'

# Database
# gem 'unicode-display_width' ,'~> 0.1.1'
# gem 'hirb', '~> 0'
# gem 'hirb-unicode', '~> 0'
gem 'sequel', '~> 5.49'

# Asynchronicity
gem 'aws-sdk-sqs', '~> 1.48'
gem 'concurrent-ruby', '~> 1.1'

# WORKER
# gem 'eventmachine', '>= 0.12.0'
gem 'libxml', '~>3.0.0'
gem 'faye', '~> 1.4'
gem 'shoryuken', '~> 5.3'

group :development, :test do
  gem 'sqlite3', '~> 1.4'
end

# Testing
group :test do
  gem 'minitest', '~> 5.0'
  gem 'minitest-rg', '~> 5.0'
  gem 'simplecov', '~> 0'
  gem 'vcr', '~> 6.0'
  gem 'webmock', '~> 3.0'

  gem 'headless', '~> 2.3'
  gem 'page-object', '~> 2.3'
  gem 'watir', '~> 7.0'
  gem 'watir-webdriver'
  gem 'webdrivers', '~> 5.0'
end

group :development do
  gem 'rerun', '~> 0'
end

# Debugging
gem 'pry'

# Code Quality
group :development do
  gem 'flog'
  gem 'reek'
  gem 'rubocop'
end

group :production do
  gem 'pg'
end
