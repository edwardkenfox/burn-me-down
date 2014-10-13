# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'factory_girl'
require 'capybara/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # ## Mock Framework
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.infer_base_class_for_anonymous_controllers = false

  config.order = 'random'

  Capybara.default_selector = :css
  require 'capybara/poltergeist'
  Capybara.javascript_driver = :poltergeist

  config.include FactoryGirl::Syntax::Methods
  config.include SpecTestHelper
  config.include Devise::TestHelpers, type: :controller
  config.include Warden::Test::Helpers
  Warden.test_mode!

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.strategy = :truncation \
      if example.metadata[:js] || example.metadata[:truncation]

    example.run

    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # for feature test
  config.before(:each, js: true) do |_example|
    width, height = 1280, 800
    driver = Capybara.current_session.driver
    if driver.is_a? Capybara::Poltergeist::Driver
      driver.resize(width, height)
    elsif driver.is_a? Capybara::Selenium::Driver
      driver.browser.manage.window.resize_to(width, height)
    end
  end
end
