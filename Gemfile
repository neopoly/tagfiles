source "https://rubygems.org"

# Specify your gem's dependencies in tagfiles.gemspec
gemspec

group :tools do
  gem "guard"
  gem "guard-minitest"
  gem "guard-rubocop"
  gem "rubocop", "~> 0.60.0"
end

rails_version = ENV.fetch("RAILS_VERSION", ">= 0")

group :test do
  gem "rails", rails_version

  gem "simplecov"
end
