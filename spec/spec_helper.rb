require 'bundler'
Bundler.require(:default, :test)

require 'twitch_api'

RSpec.configure do |config|
  VCR.configure do |c|
    c.default_cassette_options = { record: :new_episodes }
    c.cassette_library_dir = 'spec/cassettes'
    c.hook_into :webmock
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
