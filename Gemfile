source "https://rubygems.org"

# Specify your gem's dependencies in tagfiles.gemspec
gemspec

group :tools do
  gem "rubocop"
end

rails_version = ENV.fetch("RAILS_VERSION", ">= 0")

group :test do
  gem "rails", rails_version
end
