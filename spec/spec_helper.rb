ENV["RACK_ENV"] = "test"
require 'rspec'
require 'rack/test'
require 'capybara'
require 'capybara/dsl'
require_relative '../app.rb'

module SpecHelper
  def app
    App
  end
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run_including :focus
  config.filter_run_excluding :broken
  config.run_all_when_everything_filtered = true

  config.include SpecHelper
  config.include Rack::Test::Methods
  config.include Capybara::DSL, :feature
end
