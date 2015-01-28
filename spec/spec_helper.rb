require 'codeclimate-test-reporter'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  CodeClimate::TestReporter::Formatter
]
SimpleCov.start

require 'rubygems'
require 'bundler'
require 'simplecov'
require 'vcr'

Bundler.require(:default, :development)

require 'hedwig'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :faraday, :webmock
  c.configure_rspec_metadata!
  c.ignore_hosts 'codeclimate.com'
  c.filter_sensitive_data('<TRIPADVISOR_API_KEY>') { ENV.fetch('TRIPADVISOR_API_KEY', 'NO.') }
end
