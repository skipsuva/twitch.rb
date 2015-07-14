require 'faraday'
require 'json'

module TwitchApi
  module Connection
    attr_reader :agent

    def get(path, opts={})
      response = agent.get(path, opts)
      handle_response(response)
    end

    def agent
      @agent ||= Faraday.new(url: TwitchApi::API_ENDPOINT) do |f|
        f.headers[:accept] = MEDIA_TYPE
        f.headers[:content_type] = 'application/json'
        f.headers[:user_agent] = USER_AGENT
        f.request  :url_encoded             # form-encode POST params
        f.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    private

    def handle_response(response)
      case response.status
      when 200
        parse_response(response)
      when 404
        raise NotFound, response.body
      end
    end

    def parse_response(response)
      data = JSON.parse(response.body)
    end
  end
end
