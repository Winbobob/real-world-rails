require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')
begin
  require 'yajl/bzip2'
rescue
  warn "Couldn't load yajl/bzip2, maybe you don't have bzip2-ruby installed? Continuing without running bzip2 specs."
end
require 'yajl/gzip'
require 'yajl/deflate'
require 'yajl/http_stream'

def parse_off_headers(io)
  io.each_line do |line|
    if line == "\r\n" # end of the headers
      break
    end
  end
end

describe "Yajl HTTP PUT request" do
  before(:all) do
    raw = File.new(File.expand_path(File.dirname(__FILE__) + '/fixtures/http.raw.dump'), 'r')
    parse_off_headers(raw)
    @template_hash = Yajl::Parser.parse(raw)

    raw.rewind
    parse_off_headers(raw)
    @template_hash_symbolized = Yajl::Parser.parse(raw, :symbolize_keys => true)

    @deflate = File.new(File.expand_path(File.dirname(__FILE__) + '/fixtures/http.deflate.dump'), 'r')
    @gzip = File.new(File.expand_path(File.dirname(__FILE__) + '/fixtures/http.gzip.dump'), 'r')
    @body = "blah=foo&bar=baz"
    @hashed_body = {:blah => 'foo', 'bar' => 'baz'}
  end

  after(:each) do
    @file_path = nil
  end

  def prepare_mock_request_dump(format=:raw)
    @request = File.new(File.expand_path(File.dirname(__FILE__) + "/fixtures/http.#{format}.dump"), 'r')
    @uri = 'file://'+File.expand_path(File.dirname(__FILE__) + "/fixtures/http/http.#{format}.dump")
    expect(TCPSocket).to receive(:new).and_return(@request)
    expect(@request).to receive(:write)
  end

  it "should parse a raw response" 


  it "should parse a raw response using instance method" 


  it "should parse a raw response with hashed body" 


  it "should parse a raw response and symbolize keys" 


  if defined?(Yajl::Bzip2::StreamReader)
    it "should parse a bzip2 compressed response" 


    it "should parse a bzip2 compressed response and symbolize keys" 

  end

  it "should parse a deflate compressed response" 


  it "should parse a deflate compressed response and symbolize keys" 


  it "should parse a gzip compressed response" 


  it "should parse a gzip compressed response and symbolize keys" 


  it "should raise when an HTTP code that isn't 200 is returned" 

end

