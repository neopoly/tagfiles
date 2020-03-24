source "https://rubygems.org"

group :tools do
  gem "guard"
  gem "guard-minitest"
  gem "guard-rubocop"
  gem "rubocop", "~> 0.60.0"
end

group :development, :test do
  gem "rake"
end

rails_version = ENV.fetch("RAILS_VERSION", ">= 0")

group :test do
  gem "rails", rails_version

  gem "minitest"
  gem "simplecov"
end

# Specify your gem's dependencies in tagfiles.gemspec
gemspec
