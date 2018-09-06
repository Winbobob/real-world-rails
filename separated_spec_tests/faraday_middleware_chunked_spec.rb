require 'helper'
require 'faraday_middleware/response/chunked'

describe FaradayMiddleware::Chunked, :type => :response do
  context "no transfer-encoding" do
    it "doesn't change nil body" 


    it "doesn't change an empty body" 


    it "doesn't change a normal body" 

  end

  context "transfer-encoding gzip" do
    let(:headers) { {"transfer-encoding" => "gzip"}}

    it "doesn't change nil body" 


    it "doesn't change an empty body" 


    it "doesn't change a normal body" 

  end

  context "transfer-encoding chunked" do
    let(:headers) { {"transfer-encoding" => "chunked"}}

    it "doesn't change nil body" 


    it "doesn't change an empty body" 


    it "parses a basic chunked body" 


    it "parses a chunked body with no ending chunk" 


    it "parses a chunked body with no trailing CRLF on the data chunk" 


    it "parses a chunked body with an extension" 


    it "parses a chunked body with two extensions" 


    it "parses a chunked body with two chunks" 

  end

  context "transfer-encoding chunked,chunked" do
    let(:headers) { {"transfer-encoding" => "chunked,chunked"}}

    it "parses a basic chunked body" 

  end
end

