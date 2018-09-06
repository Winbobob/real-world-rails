# encoding: binary

require_relative '_lib'

describe RestClient::Payload, :include_helpers do
  context "Base Payload" do
    it "should reset stream after to_s" 

  end

  context "A regular Payload" do
    it "should use standard enctype as default content-type" 


    it "should form properly encoded params" 


    it "should escape parameters" 


    it "should properly handle hashes as parameter" 


    it "should handle many attributes inside a hash" 


    it "should handle attributes inside an array inside an hash" 


    it "should handle arrays inside a hash inside a hash" 


    it "should form properly use symbols as parameters" 


    it "should properly handle arrays as repeated parameters" 


    it 'should not close if stream already closed' 


  end

  context "A multipart Payload" do
    it "should use standard enctype as default content-type" 


    it 'should not error on close if stream already closed' 


    it "should form properly separated multipart data" 


    it "should not escape parameters names" 


    it "should form properly separated multipart data" 


    it "should ignore the name attribute when it's not set" 


    it "should detect optional (original) content type and filename" 


    it "should handle hash in hash parameters" 


    it 'should correctly format hex boundary' 


  end

  context "streamed payloads" do
    it "should properly determine the size of file payloads" 


    it "should properly determine the size of other kinds of streaming payloads" 


    it "should have a closed? method" 

  end

  context "Payload generation" do
    it "should recognize standard urlencoded params" 


    it "should recognize multipart params" 


    it "should be multipart if forced" 


    it "should handle deeply nested multipart" 



    it "should return data if no of the above" 


    it "should recognize nested multipart payloads in hashes" 


    it "should recognize nested multipart payloads in arrays" 


    it "should recognize file payloads that can be streamed" 


    it "should recognize other payloads that can be streamed" 


    # hashery gem introduces Hash#read convenience method. Existence of #read method used to determine of content is streameable :/
    it "shouldn't treat hashes as streameable" 


    it "should recognize multipart payload wrapped in ParamsArray" 


    it "should handle non-multipart payload wrapped in ParamsArray" 


    it "should pass through Payload::Base and subclasses unchanged" 

  end
end

