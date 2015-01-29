require 'hedwig/client'
require 'hedwig/configuration'
require 'hedwig/errors'
require 'hedwig/response'
require 'hedwig/request'
require 'hedwig/version'

module Hedwig
  def self.client
    @client ||= Client.new
  end

  def self.config
    @configuration ||= Configuration.new
  end

  def self.configure
    yield self.configuration
  end
end
