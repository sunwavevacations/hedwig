module Hedwig
  # The client holds a faraday connection to the TripAdvisor API.
  # The main method receives a uri (e.g. location/12345?lang=en_US) and wraps
  # the faraday response with a Hedwig::Reponse object.
  class Client
    def connection
      @connection ||= Faraday.new(url: config.api_uri) do |conn|
        conn.request :url_encoded
        conn.response :json
        conn.adapter Faraday.default_adapter
      end
    end

    def get(uri)
      raw_response = connection.get(uri)
      Response.new(raw_response)
    end

    private

    def config
      Hedwig.config
    end
  end
end
