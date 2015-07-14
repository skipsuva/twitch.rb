module TwitchApi
  class Relation
    attr_reader :conn, :href

    def initialize(conn, href)
      @conn = conn
      @href  = href
    end

    def get
      conn.get(href)
    end
  end
end
