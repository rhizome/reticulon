source 'https://rubygems.org'

gem 'rails', '3.2.8'
#gem 'mysql'
gem 'sqlite3'
gem 'authlogic', '3.1.0'
# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.1'

group :development do
  # Deploy with Capistrano
  gem 'quiet_assets'
end

group :test do
  # Pretty printed test output
  gem 'libnotify'
  gem 'rb-inotify', '~> 0.8.8'
  gem 'faker'
  gem 'ruby-prof'
  gem 'factory_girl_rails'

  gem 'test-unit', :git => "git://github.com/test-unit/test-unit.git"
  gem 'turn', '0.8.2', :require => false
  gem 'guard-test'
  gem 'test-unit-notify'

  gem "spork", "> 0.9.0.rc"
  gem "spork-testunit"
  gem 'guard-spork'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '>= 1.2.3'
end
