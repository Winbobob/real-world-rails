require "rails_helper"
require_dependency "middleware/anonymous_cache"

describe Middleware::AnonymousCache::Helper do

  def env(opts = {})
    {
      "HTTP_HOST" => "http://test.com",
      "REQUEST_URI" => "/path?bla=1",
      "REQUEST_METHOD" => "GET",
      "rack.input" => ""
    }.merge(opts)
  end

  def new_helper(opts = {})
    Middleware::AnonymousCache::Helper.new(env(opts))
  end

  context "cachable?" do
    it "true by default" 


    it "is false for non GET" 


    it "is false if it has an auth cookie" 

  end

  context "per theme cache" do
    it "handles theme keys" 

  end

  context 'force_anonymous!' do
    before do
      RateLimiter.enable
    end

    after do
      RateLimiter.disable
    end

    it 'will revert to anonymous once we reach the limit' 

  end

  context "cached" do
    let!(:helper) do
      new_helper("ANON_CACHE_DURATION" => 10)
    end

    let!(:crawler) do
      new_helper("ANON_CACHE_DURATION" => 10, "HTTP_USER_AGENT" => "AdsBot-Google (+http://www.google.com/adsbot.html)")
    end

    after do
      helper.clear_cache
      crawler.clear_cache
    end

    it "handles brotli switching" 


    it "returns cached data for cached requests" 

  end

end

