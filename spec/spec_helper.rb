$LOAD_PATH.unshift(File.dirname(__FILE__))
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../dummy/config/environment.rb', __FILE__)
require 'rspec/rails'
require 'shoulda-matchers'
require 'database_cleaner'
require 'factory_girl'
require 'timecop'


Rails.backtrace_cleaner.remove_silencers!
DatabaseCleaner.strategy = :truncation

#
# Require test support, factories.
#
Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }
Dir[File.join(File.dirname(__FILE__), 'factories/**/*.rb')].each { |f| require f }

# Build test database in spec/dummy/db/
if defined?(ActiveRecord::Migration.maintain_test_schema!)
  ActiveRecord::Migration.maintain_test_schema! # rails 4.1+
else
  ActiveRecord::Migration.check_pending! # rails 4.0
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.infer_spec_type_from_file_location!
  config.order = :random
  config.use_transactional_fixtures = true

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
  end

  config.include Requests::JsonHelpers, type: :controller

  config.after(:each) do
    DatabaseCleaner.clean       # Truncate the database
  end
end

def mock_request(params = {})
  req = double('request')
  allow(req).to receive(:params).and_return(params)
  allow(req).to receive(:remote_ip).and_return('111.111.111.111')
  req
end

# def current_user
#   @current_user ||= FactoryGirl.create(:user, :with_company)
# end
