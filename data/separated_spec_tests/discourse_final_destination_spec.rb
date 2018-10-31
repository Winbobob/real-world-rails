require 'rails_helper'
require 'final_destination'

describe FinalDestination do

  let(:opts) do
    {
      ignore_redirects: ['https://ignore-me.com'],

      force_get_hosts: ['https://force.get.com'],

      # avoid IP lookups in test
      lookup_ip: lambda do |host|
        case host
        when 'eviltrout.com' then '52.84.143.152'
        when 'codinghorror.com' then '91.146.108.148'
        when 'discourse.org' then '104.25.152.10'
        when 'some_thing.example.com' then '104.25.152.10'
        when 'private-host.com' then '192.168.10.1'
        when 'internal-ipv6.com' then '2001:abc:de:01:3:3d0:6a65:c2bf'
        when 'ignore-me.com' then '53.84.143.152'
        when 'force.get.com' then '22.102.29.40'
        when 'wikipedia.com' then '1.2.3.4'
        else
          as_ip = IPAddr.new(host)
          host
        end
      end
    }
  end

  let(:doc_response) do
    {
      status: 200,
      headers: { "Content-Type" => "text/html" }
    }
  end

  def redirect_response(from, dest)
    stub_request(:head, from).to_return(
      status: 302,
      headers: { "Location" => dest }
    )
  end

  def fd(url)
    FinalDestination.new(url, opts)
  end

  describe '.resolve' do

    it "has a ready status code before anything happens" 


    it "returns nil for an invalid url" 


    it "returns nil when read timeouts" 


    context "without redirects" do
      before do
        stub_request(:head, "https://eviltrout.com").to_return(doc_response)
      end

      it "returns the final url" 

    end

    it "ignores redirects" 


    context "underscores in URLs" do
      before do
        stub_request(:head, 'https://some_thing.example.com').to_return(doc_response)
      end

      it "doesn't raise errors with underscores in urls" 

    end

    context "with a couple of redirects" do
      before do
        redirect_response("https://eviltrout.com", "https://codinghorror.com/blog")
        redirect_response("https://codinghorror.com/blog", "https://discourse.org")
        stub_request(:head, "https://discourse.org").to_return(doc_response)
      end

      it "returns the final url" 

    end

    context "with too many redirects" do
      before do
        redirect_response("https://eviltrout.com", "https://codinghorror.com/blog")
        redirect_response("https://codinghorror.com/blog", "https://discourse.org")
        stub_request(:head, "https://discourse.org").to_return(doc_response)
      end

      it "returns the final url" 

    end

    context "with a redirect to an internal IP" do
      before do
        redirect_response("https://eviltrout.com", "https://private-host.com")
        stub_request(:head, "https://private-host.com").to_return(doc_response)
      end

      it "returns the final url" 

    end

    context "GET can be forced" do
      before do
        stub_request(:head, 'https://force.get.com/posts?page=4')
        stub_request(:get, 'https://force.get.com/posts?page=4')
        stub_request(:head, 'https://eviltrout.com/posts?page=2')
        stub_request(:get, 'https://eviltrout.com/posts?page=2')
      end

      it "will do a GET when forced" 


      it "will do a HEAD if not forced" 

    end

    context "HEAD not supported" do
      before do
        stub_request(:get, 'https://eviltrout.com').to_return(
          status: 301,
          headers: {
            "Location" => 'https://discourse.org',
            'Set-Cookie' => 'evil=trout'
          }
        )
        stub_request(:head, 'https://discourse.org')
      end

      context "when the status code is 405" do
        before do
          stub_request(:head, 'https://eviltrout.com').to_return(status: 405)
        end

        it "will try a GET" 

      end

      context "when the status code is 501" do
        before do
          stub_request(:head, 'https://eviltrout.com').to_return(status: 501)
        end

        it "will try a GET" 

      end

      it "correctly extracts cookies during GET" 

    end

    it "should use the correct format for cookies when there is only one cookie" 


    it "should use the correct format for cookies when there are multiple cookies" 

  end

  describe '.get' do

    it "can correctly stream with a redirect" 

  end

  describe '.validate_uri' do
    context "host lookups" do
      it "works for various hosts" 

    end
  end

  describe ".validate_url_format" do
    it "supports http urls" 


    it "supports https urls" 


    it "doesn't support ftp urls" 


    it "doesn't support IP urls" 


    it "returns false for schemeless URL" 


    it "returns false for nil URL" 


    it "returns false for invalid ports" 


    it "returns true for valid ports" 

  end

  describe ".is_dest_valid" do
    it "returns false for a valid ipv4" 


    it "returns false for private ipv4" 


    it "returns false for IPV6 via site settings" 


    it "ignores invalid ranges" 


    it "returns true for public ipv6" 


    it "returns false for private ipv6" 


    it "returns true for the base uri" 


    it "returns true for the S3 CDN url" 


    it "returns true for the CDN url" 


    it 'supports whitelisting via a site setting' 

  end

  describe "https cache" do
    it 'will cache https lookups' 

  end

  describe "#escape_url" do
    it "correctly escapes url" 

  end

end

