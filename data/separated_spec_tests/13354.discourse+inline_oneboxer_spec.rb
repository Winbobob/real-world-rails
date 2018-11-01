require 'rails_helper'
require_dependency 'inline_oneboxer'

describe InlineOneboxer do

  it "should return nothing with empty input" 


  it "can onebox a topic" 


  it "doesn't onebox private messages" 


  context "caching" do
    let(:topic) { Fabricate(:topic) }

    before do
      InlineOneboxer.purge(topic.url)
    end

    it "puts an entry in the cache" 

  end

  context ".lookup" do
    it "can lookup one link at a time" 


    it "returns nothing for unknown links" 


    it "will return the fancy title" 


    it "will not crawl domains that aren't whitelisted" 


    it "will crawl anything if allowed to" 


    it "will not return a onebox if it does not meet minimal length" 


    it "will lookup whitelisted domains" 


  end

end

