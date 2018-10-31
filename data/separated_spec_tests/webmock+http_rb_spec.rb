# encoding: utf-8

require "spec_helper"
require "acceptance/webmock_shared"
require "acceptance/http_rb/http_rb_spec_helper"

describe "HTTP.rb" do
  include HttpRbSpecHelper

  include_examples "with WebMock", :no_status_message

  context "streaming body" do
    let(:response) { HTTP.get "http://example.com" }
    before { stub_simple_request "example.com", 302, {}, "abc" }

    it "works as if it was streamed from socket" 


    it "fails if body was already streamed" 

  end

  context "without following redirects" do
    let(:response) { http_request(:get, "http://example.com") }
    let(:headers)  { response.headers }

    it "stops on first request" 

  end

  context "following redirects" do
    let(:options)  { { follow: true } }
    let(:response) { http_request(:get, "http://example.com", options) }
    let(:headers)  { response.headers }

    it "returns response of destination" 

  end

  context "restored request uri on replayed response object" do
    it "keeps non-default port" 


    it "does not injects default port" 


    it "strips out default port even if it was explicitly given" 

  end

  context "streamer" do
    it "can be closed" 

  end
end

