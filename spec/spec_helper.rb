# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'
require 'rspec/autorun'
require 'rspec/custom_matchers'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

Geocoder.configure(:lookup => :test)

RSpec.configure do |config|
  config.mock_with :rspec

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  #models
  config.include RSpec::Rails::ModelExampleGroup, :example_group => {:file_path => /\bspec\/lib\//}

  config.use_transactional_fixtures = true
  config.treat_symbols_as_metadata_keys_with_true_values = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Devise helpers
  config.include Devise::TestHelpers, :type => :controller
end
