module Hedwig
  class Error < StandardError; end

  # HTTP errors
  class HttpError < Error; end
  class ServerError < HttpError; end

  # Service errors
  class ServiceError < Error
    attr_reader :error

    def initialize(response_body = {})
      @error = response_body.fetch('error', {})
    end

    def message
      error['message']
    end

    def code
      error['code']
    end

    def type
      error['type']
    end
  end

  class AccessDenied < ServiceError; end
  class ResourceNotFound < ServiceError; end
end
