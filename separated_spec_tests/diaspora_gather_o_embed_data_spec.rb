# frozen_string_literal: true

describe Workers::GatherOEmbedData do
  before do
    @flickr_oembed_data = {
      "trusted_endpoint_url" => "__!SPOOFED!__",
      "version" => "1.0",
      "type" => "photo",
      "author_url" => "http://www.flickr.com/photos/bees/",
      "cache_age" => 3600,
      "provider_name" => "Flickr",
      "provider_url" => "http://www.flickr.com/",
      "title" => "ZB8T0193",
      "author_name" => "Bees",
      "width" => "240",
      "height" => "160",
      "url" => "https://farm4.static.flickr.com/3123/2341623661_7c99f48bbf_m.jpg"
    }

    @flickr_oembed_url = "https://www.flickr.com/services/oembed/"
    @flickr_photo_url = "http://www.flickr.com/photos/bees/2341623661"
    @flickr_oembed_get_request = "#{@flickr_oembed_url}" \
      "?format=json&frame=1&iframe=1&maxheight=420&maxwidth=420&url=#{@flickr_photo_url}"

    @no_oembed_url = 'http://www.we-do-not-support-oembed.com/index.html'

    @status_message = FactoryGirl.create(:status_message)

    stub_request(:get, @flickr_oembed_get_request).to_return(:status => 200, :body => @flickr_oembed_data.to_json)
    stub_request(:get, @no_oembed_url).to_return(:status => 200, :body => '<html><body>hello there</body></html>')
  end

  describe '.perform' do
    it 'requests not data from the internet' 


    it 'requests not data from the internet only once' 


    it 'creates one cache entry' 


    it 'creates no cache entry for unsupported pages' 


    it 'gracefully handles a deleted post' 

  end
end

