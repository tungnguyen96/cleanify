source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "rails", "~> 5.2.2", ">= 5.2.2.1"

# Dependencies for `pg` gem:
#   sudo apt-get install postgresql
#   sudo apt-get install libpq-dev
gem "pg"

# Asset precompile for production
gem "uglifier", require: true

# Convert common request to ajax
gem "turbolinks"

# Rack server
gem "puma", "~> 3.11"

# Speed up boot time
gem "bootsnap", ">= 1.1.0", require: false

gem "kaminari"
gem "simple_form"
gem "httparty"
gem "koala"
gem "grape"

group :development, :test do
  gem "mysql2", ">= 0.4.4", "< 0.6.0"
  gem "simplecov", require: false, group: :test
  gem "rspec-rails"
  gem "awesome_print"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "pry", platforms: [:mri, :mingw, :x64_mingw]
  gem "rubocop", require: false
  gem "rubocop-performance"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
