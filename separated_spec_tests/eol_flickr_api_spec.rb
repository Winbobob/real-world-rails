require "spec_helper"
require('flickr_api')

def set_net_http_expectation(name)
  url = @responses[name][0]
  resp = @responses[name][1]
  parsed_url = URI.parse(url)
  URI.should_receive(:parse).with(url).and_return(parsed_url)
  Net::HTTP.should_receive(:get).with(parsed_url).exactly(1).times.and_return(resp)
end

describe 'FlickrApi' do
  before(:all) do
    @now = Time.now.to_i
    # http://www.flickr.com/photos/encyclopediaoflife/5416503569/ - a photo I use for testing for EOL
    @photo_id = 5416503569
    @flickr_api = FlickrApi.new(api_key: $FLICKR_API_KEY,
                                secret: $FLICKR_SECRET,
                                auth_frob: $FLICKR_FROB,
                                auth_token: $FLICKR_TOKEN)
    sleep 1
    @responses = @flickr_api.mock_data(@photo_id, @now) # URLs are only known to the API.  This helps. It's
    # confusing, though, in order to make the code easier to write.  This returns a hash.  The keys are descriptions
    # of which response it contains.  The value is an array: the first member of the array is the URL to expect, and
    # the second is a valid response.
  end

  it 'should create a login url' 


  it 'should recieve a test echo response' 


  it 'should return nil of something goes wrong' 


  it 'should recieve an authentication frob' 


  it 'global token should be valid' 


  it 'should get photo information' 


  it 'should list photo comments' 


  it 'should list photo comments within a minimum date range' 


  # # not testing these as I'd rather not have comments go to my photo each
  # # time the tests run. We're also not allowing delete, just write
  # it 'should be able to add comments'
  # it 'should be able to delete comments'
end

