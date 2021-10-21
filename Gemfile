source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '>= 3.0.0'

gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'

gem 'activestorage-validator'

gem 'bootsnap', '>= 1.4.4', require: false

gem 'rswag-api'
gem 'rswag-ui'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
  gem 'rswag-specs'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
