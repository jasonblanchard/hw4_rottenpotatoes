source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'simplecov'
end
group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer'              
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'haml'

# add to end of Gemfile
group :test, :development do
  gem 'database_cleaner' # to clear Cucumber's test database between runs
  gem 'capybara'         # lets Cucumber pretend to be a web browser
  gem 'launchy'          # a useful debugging aid for user stories
  gem 'rspec-rails'
  gem 'factory_girl'
end

