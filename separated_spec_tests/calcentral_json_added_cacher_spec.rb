describe Cache::JsonAddedCacher do
  class JsonCachingTestClass
    include Cache::CachedFeed
    include Cache::JsonAddedCacher
    def get_feed_internal
      {}
    end
    def instance_key
      'sid'
    end
  end
  subject { JsonCachingTestClass.new }

  it 'caches the JSON version of the feed' 


  it 'expires the JSON cache as well as the original feed' 


end

