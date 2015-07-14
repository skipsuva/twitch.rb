module TwitchApi
  class Client
    module Streams
      def stream(channel)
        get "/kraken/streams/#{channel}"
      end
    end
  end
end
