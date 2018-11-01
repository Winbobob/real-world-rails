require 'spec_helper'

describe Rack::Test::Cookie do
  subject(:cookie) { Rack::Test::Cookie.new(cookie_string) }

  let(:cookie_string) { raw_cookie_string }

  let(:raw_cookie_string) do
    [
      'cookie_name=' + CGI.escape(value),
      'domain=' + domain,
      'path=' + path,
      'expires=' + expires
    ].join(Rack::Test::CookieJar::DELIMITER)
  end

  let(:http_only_raw_cookie_string) do
    raw_cookie_string + Rack::Test::CookieJar::DELIMITER + 'HttpOnly'
  end

  let(:http_only_secure_raw_cookie_string) do
    http_only_raw_cookie_string + Rack::Test::CookieJar::DELIMITER + 'secure'
  end

  let(:value) { 'the cookie value' }
  let(:domain) { 'www.example.org' }
  let(:path) { '/' }
  let(:expires) { 'Mon, 10 Aug 2015 14:40:57 0100' }

  describe '#to_h' do
    let(:cookie_string) { http_only_secure_raw_cookie_string }

    it 'returns the cookie value and all options' 

  end

  describe '#to_hash' do
    it 'is an alias for #to_h' 

  end

  describe '#http_only?' do
    context 'for a non HTTP only cookie' do
      it 'returns false' 

    end

    context 'for a HTTP only cookie' do
      let(:cookie_string) { http_only_raw_cookie_string }

      it 'returns true' 

    end
  end
end

