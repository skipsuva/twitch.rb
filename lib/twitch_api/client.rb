require 'twitch_api/errors'
require 'twitch_api/resource'
require 'twitch_api/relation'
require 'twitch_api/connection'
require 'twitch_api/client/streams'

module TwitchApi
  API_ENDPOINT = "https://api.twitch.tv".freeze
  USER_AGENT   = "Twitch.rb Ruby Gem #{TwitchApi::VERSION}".freeze
  MEDIA_TYPE   = "application/vnd.twitchtv.v3+json".freeze

  class Client
    include TwitchApi::Connection
    include TwitchApi::Client::Streams
  end
end
