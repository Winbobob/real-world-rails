require 'spec_helper'
require 'acceptance/webmock_shared'
require 'acceptance/excon/excon_spec_helper'

describe "Excon" do
  include ExconSpecHelper
  include_context "with WebMock", :no_url_auth

  it 'should allow Excon requests to use query hash paramters' 


  it 'should support Excon :expects options' 


  context "with response_block" do
    it "should support excon response_block for real requests", net_connect: true do
      a = []
      WebMock.allow_net_connect!
      r = Excon.new('http://httpstat.us/200', headers: { "Accept" => "*" }).
        get(response_block: lambda {|e, remaining, total| a << e}, chunk_size: 1)
      expect(a).to eq(["2", "0", "0", " ", "O", "K"])
      expect(r.body).to eq("")
    end

    it "should support excon response_block" 


    it "should invoke callbacks with response body even if a real request is made", net_connect: true do
      a = []
      WebMock.allow_net_connect!
      response = nil
      WebMock.after_request { |_, res|
        response = res
      }
      r = Excon.new('http://httpstat.us/200', headers: { "Accept" => "*" }).
        get(response_block: lambda {|e, remaining, total| a << e}, chunk_size: 1)
      expect(response.body).to eq("200 OK")
      expect(a).to eq(["2", "0", "0", " ", "O", "K"])
      expect(r.body).to eq("")
    end
  end

  let(:file) { File.new(__FILE__) }
  let(:file_contents) { File.read(__FILE__) }

  it 'handles file uploads correctly' 


  describe '.request_params_from' do

    it 'rejects invalid request keys' 


  end

end

