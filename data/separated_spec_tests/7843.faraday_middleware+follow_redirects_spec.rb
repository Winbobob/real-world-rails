require 'helper'
require 'faraday_middleware/response/follow_redirects'
require 'faraday'

# expose a method in Test adapter that should have been public
Faraday::Adapter::Test::Stubs.class_eval { public :new_stub }

describe FaradayMiddleware::FollowRedirects do
  let(:middleware_options) { Hash.new }

  shared_examples_for "a successful redirection" do |status_code|
    it "follows the redirection for a GET request" 


    it "follows the redirection for a HEAD request" 


    it "follows the redirection for a OPTIONS request" 


    it "tolerates invalid characters in redirect location" 

  end

  shared_examples_for "a forced GET redirection" do |status_code|
    [:put, :post, :delete, :patch].each do |method|
      it "a #{method.to_s.upcase} request is converted to a GET" 

    end
  end

  shared_examples_for "a replayed redirection" do |status_code|
    it "redirects with the original request headers" 


    [:put, :post, :delete, :patch].each do |method|
      it "replays a #{method.to_s.upcase} request" 

    end

    [:put, :post, :patch].each do |method|
      it "forwards request body for a #{method.to_s.upcase} request" 

    end
  end

  it "returns non-redirect response results" 


  it "follows a single redirection" 


  it "follows many redirections" 


  it "raises a FaradayMiddleware::RedirectLimitReached after 3 redirections (by default)" 


  it "raises a FaradayMiddleware::RedirectLimitReached after the initialized limit" 


  it "ignore fragments in the Location header" 


  described_class::REDIRECT_CODES.each do |code|
    context "for an HTTP #{code} response" do
      it "raises a FaradayMiddleware::RedirectLimitReached when Location header is missing" 

    end
  end

  [301, 302].each do |code|
    context "for an HTTP #{code} response" do
      it_behaves_like 'a successful redirection', code

      context "by default" do
        it_behaves_like 'a forced GET redirection', code
      end

      context "with standards compliancy enabled" do
        let(:middleware_options) { { :standards_compliant => true } }
        it_behaves_like 'a replayed redirection', code
      end
    end
  end

  context "for an HTTP 303 response" do
    context "by default" do
      it_behaves_like 'a successful redirection', 303
      it_behaves_like 'a forced GET redirection', 303
    end

    context "with standards compliancy enabled" do
      let(:middleware_options) { { :standards_compliant => true } }
      it_behaves_like 'a successful redirection', 303
      it_behaves_like 'a forced GET redirection', 303
    end
  end

  context "for an HTTP 307 response" do
    context "by default" do
      it_behaves_like 'a successful redirection', 307
      it_behaves_like 'a replayed redirection', 307
    end

    context "with standards compliancy enabled" do
      let(:middleware_options) { { :standards_compliant => true } }
      it_behaves_like 'a successful redirection', 307
      it_behaves_like 'a replayed redirection', 307
    end
  end

  context "for an HTTP 308 response" do
    context "by default" do
      it_behaves_like 'a successful redirection', 308
      it_behaves_like 'a replayed redirection', 308
    end

    context "with standards compliancy enabled" do
      let(:middleware_options) { { :standards_compliant => true } }
      it_behaves_like 'a successful redirection', 308
      it_behaves_like 'a replayed redirection', 308
    end
  end

  context "with a callback" do
    it "calls the callback" 

  end

  # checks env hash in request phase for basic validity
  class Lint < Struct.new(:app)
    def call(env)
      if env[:status] or env[:response] or env[:response_headers]
        raise "invalid request: #{env.inspect}"
      end
      if defined?(Faraday::Env) && !env.is_a?(Faraday::Env)
        raise "expected Faraday::Env, got #{env.class}"
      end
      app.call(env)
    end
  end

  private

  def connection(options = middleware_options)
    Faraday.new do |c|
      c.use described_class, options
      c.use Lint
      c.adapter :test do |stub|
        yield(stub) if block_given?
      end
    end
  end
end

