require 'forwardable'

module Hedwig
  class Response

    extend Forwardable

    attr_reader :raw_response

    delegate [:body, :status] => :raw_response

    def initialize(raw_response)
      @raw_response = raw_response
    end

    def success?
      (200..299).include?(status)
    end

    def on_error
      yield self unless success?
      self
    end

    def raise_errors
      case status
      when 401
        raise AccessDenied.new(body)
      when 404
        raise ResourceNotFound.new(body)
      when (400..499)
        raise ServiceError.new(body)
      when (500..599)
        raise ServerError.new(body)
      end
    end

  end
end
