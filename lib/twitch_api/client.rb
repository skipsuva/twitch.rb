require 'twitch_api/client/streams'

include TwitchApi::Client::Streams

module TwitchApi
  API_ENDPOINT = "https://api.twitch.tv/".freeze
  USER_AGENT   = "Twitch.rb Ruby Gem #{TwitchApi::VERSION}".freeze
  MEDIA_TYPE   = "application/vnd.twitchtv.v3+json".freeze

  class Client
  end
end
