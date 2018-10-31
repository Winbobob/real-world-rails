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

  context "crawler blocking" do
    let :non_crawler do
      {
        "HTTP_USER_AGENT" =>
        "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36"
      }
    end

    def get(path, options)
      middleware = Middleware::AnonymousCache.new(lambda { |_| [200, {}, []] })
      @env = env({
        "REQUEST_URI" => path,
        "PATH_INFO" => path,
        "REQUEST_PATH" => path
      }.merge(options[:headers]))
      @status, @response_header, @response = middleware.call(@env)
    end

    it "applies whitelisted_crawler_user_agents correctly" 


    it "doesn't block api requests" 


    it "applies blacklisted_crawler_user_agents correctly" 


    it "should never block robots.txt" 


    it "should never block srv/status" 


    it "blocked crawlers shouldn't log page views" 


    it "blocks json requests" 

  end

end

