require 'spec_helper'

describe RspecApiDocumentation::OpenApi::Node do
  let(:node) { RspecApiDocumentation::OpenApi::Node.new }
  its(:settings) { should == {} }

  describe ".add_setting" do
    it "should allow creating a new setting" 


    it "should allow setting a default" 


    it "should allow the default setting to be a lambda" 


    it "should allow setting a schema" 


    context "setting can be required" do
      it "should raise error without value and default option" 


      it "should not raise error with default option" 


      it "should not raise error with value and without default option" 

    end
  end
end

