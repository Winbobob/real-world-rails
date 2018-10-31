require 'helper'
require 'faraday_middleware/response/parse_yaml'

describe FaradayMiddleware::ParseYaml, :type => :response do
  context "no type matching" do
    it "doesn't change nil body" 


    it "returns false for empty body" 


    it "parses yaml body" 

  end

  context "with preserving raw" do
    let(:options) { {:preserve_raw => true} }

    it "parses yaml body" 


    it "can opt out of preserving raw" 

  end

  context "with regexp type matching" do
    let(:options) { {:content_type => /\byaml$/} }

    it "parses json body of correct type" 


    it "ignores json body of incorrect type" 

  end

  it "chokes on invalid yaml" 


  context "SafeYAML options" do
    let(:body) { 'a: 1' }
    let(:result) { {a: 1} }
    let(:options) do
      {
        :parser_options => {
          :symbolize_names => true
        }
      }
    end

    it "passes relevant options to SafeYAML load" 

  end
end

