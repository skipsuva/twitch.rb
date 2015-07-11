module TwitchApi
  class Client
    module Streams
      def stream(channel)
        get Stream.path(channel)
      end
    end
  end
end
