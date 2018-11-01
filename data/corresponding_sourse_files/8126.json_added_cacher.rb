# Cache the JSONified feed (as well as the raw feed) for maximum efficiency when we're called by a controller.
module Cache
  module JsonAddedCacher

    def self.included base
      base.extend ClassMethods
    end

    def get_feed_as_json(force_cache_write=false)
      self.class.fetch_from_cache(self.class.json_key(instance_key), force_cache_write) do
        get_feed(force_cache_write).to_json
      end
    end

    def extended_instance_keys
      super << self.class.json_key(instance_key)
    end

    module ClassMethods
      def json_key(id)
        "json-#{id}"
      end

      def expire(id = nil)
        super(id)
        key = cache_key(json_key(id))
        Rails.cache.delete(key)
        Rails.logger.debug "Expired cache_key #{key}"
      end
    end

  end
end
