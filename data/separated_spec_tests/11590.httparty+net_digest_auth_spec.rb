require 'spec_helper'

RSpec.describe Net::HTTPHeader::DigestAuthenticator do
  def setup_digest(response)
    digest = Net::HTTPHeader::DigestAuthenticator.new("Mufasa",
                                                      "Circle Of Life", "GET", "/dir/index.html", response)
    allow(digest).to receive(:random).and_return("deadbeef")
    allow(Digest::MD5).to receive(:hexdigest) { |str| "md5(#{str})" }
    digest
  end

  def authorization_header
    @digest.authorization_header.join(", ")
  end

  def cookie_header
    @digest.cookie_header
  end

  context 'Net::HTTPHeader#digest_auth' do
    let(:headers) {
      (Class.new do
        include Net::HTTPHeader
        def initialize
          @header = {}
          @path = '/'
          @method = 'GET'
        end
      end).new
    }

    let(:response){
      (Class.new do
        include Net::HTTPHeader
        def initialize
          @header = {}
          self['WWW-Authenticate'] =
          'Digest realm="testrealm@host.com", qop="auth,auth-int", nonce="dcd98b7102dd2f0e8b11d0f600bfb0c093", opaque="5ccc069c403ebaf9f0171e9517f40e41"'
        end
      end).new
    }

    it 'should set the authorization header' 

  end

  context "with a cookie value in the response header" do
    before do
      @digest = setup_digest({
        'www-authenticate' => 'Digest realm="myhost@testrealm.com"',
        'Set-Cookie' => 'custom-cookie=1234567'
      })
    end

    it "should set cookie header" 

  end

  context "without a cookie value in the response header" do
    before do
      @digest = setup_digest({
        'www-authenticate' => 'Digest realm="myhost@testrealm.com"'
      })
    end

    it "should set empty cookie header array" 

  end

  context "with an opaque value in the response header" do
    before do
      @digest = setup_digest({
        'www-authenticate' => 'Digest realm="myhost@testrealm.com", opaque="solid"'
      })
    end

    it "should set opaque" 

  end

  context "without an opaque valid in the response header" do
    before do
      @digest = setup_digest({
        'www-authenticate' => 'Digest realm="myhost@testrealm.com"'
      })
    end

    it "should not set opaque" 

  end

  context "with specified quality of protection (qop)" do
    before do
      @digest = setup_digest({
        'www-authenticate' => 'Digest realm="myhost@testrealm.com", nonce="NONCE", qop="auth"'
      })
    end

    it "should set prefix" 


    it "should set username" 


    it "should set digest-uri" 


    it "should set qop" 


    it "should set cnonce" 


    it "should set nonce-count" 


    it "should set response" 

  end

  context "when quality of protection (qop) is unquoted" do
    before do
      @digest = setup_digest({
        'www-authenticate' => 'Digest realm="myhost@testrealm.com", nonce="NONCE", qop=auth'
      })
    end

    it "should still set qop" 

  end

  context "with unspecified quality of protection (qop)" do
    before do
      @digest = setup_digest({
        'www-authenticate' => 'Digest realm="myhost@testrealm.com", nonce="NONCE"'
      })
    end

    it "should set prefix" 


    it "should set username" 


    it "should set digest-uri" 


    it "should not set qop" 


    it "should not set cnonce" 


    it "should not set nonce-count" 


    it "should set response" 

  end

  context "with http basic auth response when net digest auth expected" do
    it "should not fail" 

  end

  context "with multiple authenticate headers" do
    before do
      @digest = setup_digest({
        'www-authenticate' => 'NTLM, Digest realm="myhost@testrealm.com", nonce="NONCE", qop="auth"'
      })
    end

    it "should set prefix" 


    it "should set username" 


    it "should set digest-uri" 


    it "should set qop" 


    it "should set cnonce" 


    it "should set nonce-count" 


    it "should set response" 

  end

  context "with algorithm specified" do
    before do
      @digest = setup_digest({
        'www-authenticate' => 'Digest realm="myhost@testrealm.com", nonce="NONCE", qop="auth", algorithm=MD5'
      })
    end

    it "should recognise algorithm was specified" 


    it "should set the algorithm header" 

  end

  context "with md5-sess algorithm specified" do
    before do
      @digest = setup_digest({
        'www-authenticate' => 'Digest realm="myhost@testrealm.com", nonce="NONCE", qop="auth", algorithm=MD5-sess'
      })
    end

    it "should recognise algorithm was specified" 


    it "should set the algorithm header" 


    it "should set response using md5-sess algorithm" 


  end

end

