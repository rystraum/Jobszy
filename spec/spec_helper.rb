require 'rubygems'
require 'spork'

Spork.prefork do
  
  # Prevent Mongoid from preloading all models
  # https://github.com/timcharper/spork/wiki/Spork.trap_method-Jujutsu
  require "rails/mongoid"
  Spork.trap_class_method(Rails::Mongoid, :load_models)

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  
  # Delay Devise route loading
  # https://github.com/timcharper/spork/wiki/Spork.trap_method-Jujutsu
  Spork.trap_method(Rails::Application::RoutesReloader, :reload!)

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec

    # When :focus tag exists, run only that test.
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run focus: true
    config.run_all_when_everything_filtered = true

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false  


    # Clean up the database
    require 'database_cleaner'
    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.orm = "mongoid"
    end

    config.include ActionView::TestCase::Behavior, example_group:{ file_path:%r{spec/presenters} }

    config.before(:each) do
      DatabaseCleaner.clean
    end

  end
end

Spork.each_run do
end
