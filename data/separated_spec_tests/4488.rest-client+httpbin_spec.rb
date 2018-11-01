require_relative '_lib'
require 'json'

require 'zlib'

describe RestClient::Request do
  before(:all) do
    WebMock.disable!
  end

  after(:all) do
    WebMock.enable!
  end

  def default_httpbin_url
    # add a hack to work around java/jruby bug
    # java.lang.RuntimeException: Could not generate DH keypair with backtrace
    # Also (2017-04-09) Travis Jruby versions have a broken CA keystore
    if ENV['TRAVIS_RUBY_VERSION'] =~ /\Ajruby-/
      'http://httpbin.org/'
    else
      'https://httpbin.org/'
    end
  end

  def httpbin(suffix='')
    url = ENV.fetch('HTTPBIN_URL', default_httpbin_url)
    unless url.end_with?('/')
      url += '/'
    end

    url + suffix
  end

  def execute_httpbin(suffix, opts={})
    opts = {url: httpbin(suffix)}.merge(opts)
    RestClient::Request.execute(opts)
  end

  def execute_httpbin_json(suffix, opts={})
    JSON.parse(execute_httpbin(suffix, opts))
  end

  describe '.execute' do
    it 'sends a user agent' 


    it 'receives cookies on 302' 


    it 'passes along cookies through 302' 


    it 'handles quote wrapped cookies' 


    it 'sends basic auth' 


    it 'handles gzipped/deflated responses' 


    it 'does not uncompress response when accept-encoding is set' 

  end
end

