source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.7.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0.3", ">= 6.0.3.3"
# Use postgresql as the database for Active Record
gem "pg"
# Use Puma as the app server
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.4.2", require: false
gem "config"
gem "devise"
gem "dotenv-rails"
gem "faker"
gem "grape"
gem "grape-entity"
gem "grape_on_rails_routes"
gem "i18n"
gem "jbuilder", "~> 2.7"
gem "jwt"
gem "puma", "~> 4.1"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem "pry-rails"
end

group :development do
  gem "listen", "~> 3.2"
  gem "rails_best_practices"
  gem "rubocop", require: false
  gem "rubocop-rails", "~> 2.3.2", require: false
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
