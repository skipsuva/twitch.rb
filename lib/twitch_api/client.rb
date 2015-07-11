require 'twitch_api/stream'
require 'twitch_api/client/streams'
require 'twitch_api/connection'

include TwitchApi::Connection
include TwitchApi::Client::Streams

module TwitchApi
  # Default API endpoint
  API_ENDPOINT = "https://api.twitch.tv/".freeze

  # Default User Agent header string
  USER_AGENT   = "Twitch.rb Ruby Gem #{TwitchApi::VERSION}".freeze

  # Default media type
  MEDIA_TYPE   = "application/vnd.twitchtv.v3+json".freeze

  class Client
    def initialize(opts={})
    end

    def api_endpoint
      API_ENDPOINT
    end

    def user_agent
      USER_AGENT
    end

    def default_media_type
      MEDIA_TYPE
    end
  end
end
