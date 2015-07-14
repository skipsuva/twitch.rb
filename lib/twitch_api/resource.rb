module TwitchApi
  class Resource
    attr_reader :conn

    def initialize(conn, data)
      @conn = conn

      if data.is_a?(Hash)
        process_hash(data)
      elsif data.is_a?(Array)
        process_array(data)
      else
        raise InvalidResource, data
      end
    end

    def rels
      @rels ||= {}
    end

    private

    def process_hash(hash)
      hash.each do |k, v|
        singleton_class.class_eval do; attr_reader k; end

        if k =~ /^_links$/
          instance_variable_set(:"@#{k}", process_rels(v))
        else
          instance_variable_set(:"@#{k}", process_value(v))
        end
      end
    end

    def process_array(array)
      array.map do |val|
        process_value(val)
      end
    end

    def process_value(val)
      if val.is_a?(Hash)
        Resource.new(conn, val)
      elsif val.is_a?(Array)
        process_array(val)
      else
        val
      end
    end

    def process_rels(hash)
      hash.each do |k, v|
        rels[k] = Relation.new(conn, v)
      end
    end
  end
end
