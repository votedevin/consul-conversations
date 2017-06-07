require 'bundler/setup'

require 'consul/conversations'
require 'combustion'

Combustion.initialize! :all

require 'rspec/rails'

Dir["./spec/shared/**/*.rb"].each(&method(:require))

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.disable_monkey_patching!
  config.default_formatter = 'doc' if config.files_to_run.one?
end
