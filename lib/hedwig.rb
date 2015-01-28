require 'faraday'
require 'hedwig/configuration'
require 'hedwig/version'

module Hedwig
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield self.configuration
  end
end
