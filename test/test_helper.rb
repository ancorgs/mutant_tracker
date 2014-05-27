ENV['RAILS_ENV'] ||= 'test'

# FIXME coverage information is not correctly reported using rake
# https://github.com/colszowka/simplecov/issues/290
require 'simplecov'
SimpleCov.start 'rails'
#SimpleCov.command_name

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'database_cleaner'
require 'capybara/rails'

class ActiveSupport::TestCase

  include FactoryGirl::Syntax::Methods

  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end

class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Capybara::DSL
end
