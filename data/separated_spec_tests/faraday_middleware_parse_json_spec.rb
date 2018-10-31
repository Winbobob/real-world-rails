require 'helper'
require 'faraday_middleware/response/parse_json'

describe FaradayMiddleware::ParseJson, :type => :response do
  context "no type matching" do
    it "doesn't change nil body" 


    it "nullifies empty body" 


    it "parses json body" 

  end

  context "with preserving raw" do
    let(:options) { {:preserve_raw => true} }

    it "parses json body" 


    it "can opt out of preserving raw" 

  end

  context "with regexp type matching" do
    let(:options) { {:content_type => /\bjson$/} }

    it "parses json body of correct type" 


    it "ignores json body of incorrect type" 

  end

  context "with array type matching" do
    let(:options) { {:content_type => %w[a/b c/d]} }

    it "parses json body of correct type" 


    it "ignores json body of incorrect type" 

  end

  it "chokes on invalid json" 


  it "includes the response on the ParsingError instance" 


  context "with mime type fix" do
    let(:middleware) {
      app = described_class::MimeTypeFix.new(lambda {|env|
        Faraday::Response.new(env)
      }, :content_type => /^text\//)
      described_class.new(app, :content_type => 'application/json')
    }

    it "ignores completely incompatible type" 


    it "ignores compatible type with bad data" 


    it "corrects compatible type and data" 


    it "corrects compatible type even when data starts with whitespace" 

  end

  context "HEAD responses" do
    it "nullifies the body if it's only one space" 


    it "nullifies the body if it's two spaces" 

  end

  context "JSON options" do
    let(:body) { '{"a": 1}' }
    let(:result) { {a: 1} }
    let(:options) do
      {
        :parser_options => {
          :symbolize_names => true
        }
      }
    end

    it "passes relevant options to JSON parse" 

  end
end

