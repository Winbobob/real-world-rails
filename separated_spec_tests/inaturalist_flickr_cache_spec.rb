require "spec_helper"

describe FlickrCache,
  disabled: (CONFIG.flickr.shared_secret == "09af09af09af09af") do

  before(:all) do
    @flickraw = flickr
  end

  it "creates the endpoint" 


  it "caches the result" 


  #
  # kueda 2017-11-17 Not sure whatt this was supposed to test. Seems like
  # getSizes with params like tags: 'animals' should fail b/c a photo ID wasn't
  # specified, and failed requests don't seem to get cached
  # 
  # it "cached calls to any method" do
  #   expect(ApiEndpointCache.count).to eq 0
  #   # expect(@flickraw.photos).to receive(:getSizes).and_return(@flickr_response)
  #   fetched = FlickrCache.fetch(@flickraw, "photos", "getSizes", tags: "animals")
  #   expect(ApiEndpointCache.count).to eq 1
  #   cache = ApiEndpointCache.first
  #   expect(cache.request_url).to eq "flickr.photos.getSizes({\"tags\":\"animals\"})"
  #   # expect(cache.response).to eq "{\"table\":{\"url\":\"some image URL\"}}"
  #   expect(cache.cached?).to be true
  #   # expect(fetched).to be @flickr_response
  # end

end

