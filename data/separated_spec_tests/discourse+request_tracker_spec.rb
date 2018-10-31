require "rails_helper"
require_dependency "middleware/request_tracker"

describe Middleware::RequestTracker do

  def env(opts = {})
    {
      "HTTP_HOST" => "http://test.com",
      "HTTP_USER_AGENT" => "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",
      "REQUEST_URI" => "/path?bla=1",
      "REQUEST_METHOD" => "GET",
      "HTTP_ACCEPT" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
      "rack.input" => ""
    }.merge(opts)
  end

  context "log_request" do
    before do
      freeze_time Time.now
      ApplicationRequest.clear_cache!
    end

    def log_tracked_view(val)
      data = Middleware::RequestTracker.get_data(env(
        "HTTP_DISCOURSE_TRACK_VIEW" => val
      ), ["200", { "Content-Type" => 'text/html' }], 0.2)

      Middleware::RequestTracker.log_request(data)
    end

    it "can exclude/include based on custom header" 


    it "can log requests correctly" 


  end

  context "rate limiting" do

    class TestLogger
      attr_accessor :warnings

      def initialize
        @warnings = 0
      end

      def warn(*args)
        @warnings += 1
      end
    end

    before do
      RateLimiter.enable
      RateLimiter.clear_all_global!

      @old_logger = Rails.logger
      Rails.logger = TestLogger.new
    end

    after do
      RateLimiter.disable
      Rails.logger = @old_logger
    end

    let :middleware do
      app = lambda do |env|
        [200, {}, ["OK"]]
      end

      Middleware::RequestTracker.new(app)
    end

    it "does nothing by default" 


    it "blocks private IPs if not skipped" 


    describe "register_ip_skipper" do
      before do
        Middleware::RequestTracker.register_ip_skipper do |ip|
          ip == "1.1.1.2"
        end
        global_setting :max_reqs_per_ip_per_10_seconds, 1
        global_setting :max_reqs_per_ip_mode, 'block'
      end

      after do
        Middleware::RequestTracker.unregister_ip_skipper
      end

      it "won't block if the ip is skipped" 


      it "blocks if the ip isn't skipped" 

    end

    it "does nothing for private IPs if skipped" 


    it "does warn if rate limiter is enabled via warn+block" 


    it "does warn if rate limiter is enabled" 


    it "allows assets for more requests" 


    it "does block if rate limiter is enabled" 

  end

  context "callbacks" do
    def app(result, sql_calls: 0, redis_calls: 0)
      lambda do |env|
        sql_calls.times do
          User.where(id: -100).pluck(:id)
        end
        redis_calls.times do
          $redis.get("x")
        end
        result
      end
    end

    let :logger do
      ->(env, data) do
        @env = env
        @data = data
      end
    end

    before do
      Middleware::RequestTracker.register_detailed_request_logger(logger)
    end

    after do
      Middleware::RequestTracker.unregister_detailed_request_logger(logger)
    end

    it "can correctly log detailed data" 

  end

end

