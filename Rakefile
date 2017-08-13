begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

load 'rails/tasks/statistics.rake'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

namespace :spec do
  RSpec::Core::RakeTask.new(:all) do |task|
    task.pattern = FileList['spec/**/*_spec.rb']
  end
end

task default: 'spec:all'
