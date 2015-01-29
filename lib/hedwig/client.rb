module Hedwig
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
