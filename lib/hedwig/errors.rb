module Hedwig
  class Error < StandardError; end

  # HTTP errors
  class HttpError < Error; end
  class TimeoutError < HttpError; end
  class ResourceNotFound < HttpError; end
  class ServerError < HttpError; end

  # Client errors
  class ClientError < Error; end
  class AccessDenied < ClientError; end
end
