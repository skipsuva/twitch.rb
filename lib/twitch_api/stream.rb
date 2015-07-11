module TwitchApi
  class Stream
    # Stream URL based on {TwitchApi::Client#web_endpoint}
    # @return [String]
    def self.path(channel)
      "/kraken/streams/#{channel}"
    end
  end
end
