unless ENV['CODECLIMATE_REPO_TOKEN'].nil?
  require 'simplecov'
  require 'codeclimate-test-reporter'

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    CodeClimate::TestReporter::Formatter
  ]
  SimpleCov.start
end

require 'rubygems'
require 'bundler'
require 'vcr'

Bundler.require(:default, :development)

require 'hedwig'

Hedwig.configure do |c|
  c.api_key = ENV.fetch('TRIPADVISOR_API_KEY', 'api-key')
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :faraday, :webmock
  c.configure_rspec_metadata!
  c.ignore_hosts 'codeclimate.com'
  c.filter_sensitive_data('<TRIPADVISOR_API_KEY>') { ENV.fetch('TRIPADVISOR_API_KEY', 'api-key') }
end

