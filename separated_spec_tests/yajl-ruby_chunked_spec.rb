require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Chunked parser" do
  before(:all) do
    @final = [{"abc" => 123}, {"def" => 456}]
  end

  before(:each) do
    @callback = lambda { |hash|
      # no-op
    }
    @parser = Yajl::Parser.new
    @parser.on_parse_complete = @callback
  end

  it "should parse a single chunk" 


  it "should parse a single chunk, 3 times" 


  it "should parse in two chunks" 


  it "should parse in 2 chunks, twice" 


  it "should parse 2 JSON strings, in 3 chunks" 


  it "should parse 2 JSON strings in 1 chunk" 


  it "should parse 2 JSON strings from an IO" 


  it "should parse a JSON string an IO and fire callback once" 


  it "should parse twitter_stream.json and fire callback 430 times" 


  it "should parse twitter_stream.json and fire callback 430 times, with a block as the callback" 


  it "should raise a Yajl::ParseError error if multiple JSON strings were found when no on_parse_complete callback assigned" 

end

