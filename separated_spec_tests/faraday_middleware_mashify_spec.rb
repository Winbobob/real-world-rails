require 'helper'
require 'faraday_middleware/response/mashify'

describe FaradayMiddleware::Mashify do
  MyMash = Struct.new(:body)

  context "when used", :type => :response do
    it "creates a Hashie::Mash from the body" 


    it "handles strings" 


    it "handles arrays" 


    it "handles arrays of hashes" 


    it "handles nested arrays of hashes" 


    it "handles mixed arrays" 


    it "allows for use of custom Mash subclasses at the class level" 

  end

  context "custom mash subclass", :type => :response do
    let(:options) { {:mash_class => MyMash} }

    it "instance level" 

  end
end

