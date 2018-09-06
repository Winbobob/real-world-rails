require File.expand_path(File.join(File.dirname(__FILE__), '../spec_helper'))

RSpec.describe HTTParty::CookieHash do
  before(:each) do
    @cookie_hash = HTTParty::CookieHash.new
  end

  describe "#add_cookies" do
    describe "with a hash" do
      it "should add new key/value pairs to the hash" 


      it "should overwrite any existing key" 

    end

    describe "with a string" do
      it "should add new key/value pairs to the hash" 


      it "should overwrite any existing key" 


      it "should handle '=' within cookie value" 

    end

    describe 'with other class' do
      it "should error" 

    end
  end

  # The regexen are required because Hashes aren't ordered, so a test against
  # a hardcoded string was randomly failing.
  describe "#to_cookie_string" do
    before(:each) do
      @cookie_hash.add_cookies(foo: "bar")
      @cookie_hash.add_cookies(rofl: "copter")
      @s = @cookie_hash.to_cookie_string
    end

    it "should format the key/value pairs, delimited by semi-colons" 


    it "should not include client side only cookies" 


    it "should not include client side only cookies even when attributes use camal case" 


    it "should not mutate the hash" 

  end
end

