source "https://rubygems.org"

# Specify your gem's dependencies in tagfiles.gemspec
gemspec

group :tools do
  gem "rubocop"
  gem "guard"
  gem "guard-minitest"
  gem "guard-rubocop"
end

rails_version = ENV.fetch("RAILS_VERSION", ">= 0")

group :test do
  gem "rails", rails_version

  gem "simplecov"
  gem "codeclimate-test-reporter", "~> 1.0.0"
end
