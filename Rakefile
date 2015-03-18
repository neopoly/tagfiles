require "bundler/gem_tasks"

desc "Run tests"
task default: :spec

require "rake/testtask"
Rake::TestTask.new(:spec) do |t|
  t.libs << "spec"
  t.test_files = FileList["spec/**/*_spec.rb"]
  t.verbose = false
end
