# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1"

gem "rails", "~> 7.0.5"

gem "sprockets-rails"

gem "pg"

gem "puma", "~> 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "redis", "~> 4.0"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "fabrication"
gem "faker"
gem "rspec-rails"
gem "rubocop-github", require: false
gem "rubocop-performance", require: false
gem "rubocop-rails", require: false
gem "split", "~> 4.0", require: "split/dashboard"
