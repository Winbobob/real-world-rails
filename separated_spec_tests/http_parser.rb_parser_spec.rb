if defined?(Encoding)
  Encoding.default_external = "UTF-8"
end
require "spec_helper"
require "json"

describe HTTP::Parser do
  before do
    @parser = HTTP::Parser.new

    @headers = nil
    @body = ""
    @started = false
    @done = false

    @parser.on_message_begin = proc{ @started = true }
    @parser.on_headers_complete = proc { |e| @headers = e }
    @parser.on_body = proc { |chunk| @body << chunk }
    @parser.on_message_complete = proc{ @done = true }
  end

  it "should have initial state" 


  it "should allow us to set the header value type" 


  it "should allow us to set the default header value type" 


  it "should throw an Argument Error if header value type is invalid" 


  it "should throw an Argument Error if default header value type is invalid" 


  it "should implement basic api" 


  it "should raise errors on invalid data" 


  it "should abort parser via header complete callback with a body" 


  it "should abort parser via header complete callback without a body" 


  it "should abort parser via message complete callback with a body" 


  it "should abort parser via message complete callback without a body" 


  it "should reset to initial state" 


  it "should optionally reset parser state on no-body responses" 


  it "should retain callbacks after reset" 


  it "should parse headers incrementally" 


  it "should handle multiple headers using strings" 


  it "should handle multiple headers using strings" 


  it "should handle multiple headers using mixed" 


  it "should handle a single cookie using mixed" 


  it "should support alternative api" 


  it "should ignore extra content beyond specified length" 


  it 'sets upgrade_data if available' 


  it 'sets upgrade_data to blank if un-available' 


  it 'should stop parsing headers when instructed' 


  it "should execute on_body on requests with no content-length" 



  %w[ request response ].each do |type|
    JSON.parse(File.read(File.expand_path("../support/#{type}s.json", __FILE__))).each do |test|
      test['headers'] ||= {}
      next if !defined?(JRUBY_VERSION) and HTTP::Parser.strict? != test['strict']

      it "should parse #{type}: #{test['name']}" 

    end
  end
end

