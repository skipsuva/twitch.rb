module TwitchApi
  class Resource
    def initialize(data)
      if data.is_a?(Hash)
        process_hash(data)
      elsif data.is_a?(Array)
        process_array(data)
      else
        raise InvalidResource, data
      end
    end

    private

    def process_hash(hash)
      hash.each do |k, v|
        singleton_class.class_eval do; attr_accessor k; end
        send("#{k}=", process_value(v))
      end
    end

    def process_array(array)
      array.map do |val|
        process_value(val)
      end
    end

    def process_value(val)
      if val.is_a?(Hash)
        Resource.new(val)
      elsif val.is_a?(Array)
        process_array(val)
      else
        val
      end
    end
  end
end
