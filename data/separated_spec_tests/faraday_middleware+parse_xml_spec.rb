require 'helper'
require 'faraday_middleware/response/parse_xml'

describe FaradayMiddleware::ParseXml, :type => :response do
  let(:xml)  { '<user><name>Erik Michaels-Ober</name><screen_name>sferik</screen_name></user>' }
  let(:user) { {'user' => {'name' => 'Erik Michaels-Ober', 'screen_name' => 'sferik'} } }

  context "no type matching" do
    it "doesn't change nil body" 


    it "turns empty body into empty hash" 


    it "parses xml body" 

  end

  context "with preserving raw" do
    let(:options) { {:preserve_raw => true} }

    it "parses xml body" 


    it "can opt out of preserving raw" 

  end

  context "with regexp type matching" do
    let(:options) { {:content_type => /\bxml$/} }

    it "parses xml body of correct type" 


    it "ignores xml body of incorrect type" 

  end

  context "with array type matching" do
    let(:options) { {:content_type => %w[a/b c/d]} }

    it "parses xml body of correct type" 


    it "ignores xml body of incorrect type" 

  end

  it "chokes on invalid xml" 


  context "MultiXml options" do
    let(:options) do
      {
        :parser_options => {
          :symbolize_names => true
        }
      }
    end

    it "passes relevant options to MultiXml parse" 

  end
end

