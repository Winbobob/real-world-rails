require File.dirname(__FILE__) + '/../spec_helper'

describe EmailSpec::Matchers do
  include EmailSpec::Matchers

  class MatcherMatch
    def initialize(object_to_test_match)
      @object_to_test_match = object_to_test_match
    end

    def description
      "match when provided #{@object_to_test_match.inspect}"
    end

    def matches?(matcher)
      @matcher = matcher
      matcher.matches?(@object_to_test_match)
    end

    def failure_message
      "expected #{@matcher.inspect} to match when provided #{@object_to_test_match.inspect}, but it did not"
    end

    def negative_failure_message
      "expected #{@matcher.inspect} not to match when provided #{@object_to_test_match.inspect}, but it did"
    end
  end

  def match(object_to_test_match)
    if object_to_test_match.is_a?(Regexp)
      super # delegate to rspec's built in 'match' matcher
    else
      MatcherMatch.new(object_to_test_match)
    end
  end

  describe "#reply_to" do
    it "should match when the email is set to deliver to the specified address" 


    it "should match given a name and address" 


    it "should give correct failure message when the email is not set to deliver to the specified address" 


  end

  describe "#deliver_to" do
    it "should match when the email is set to deliver to the specidied address" 


    it "should match when a list of emails is exact same as all of the email's recipients" 


    it "should match when an array of emails is exact same as all of the email's recipients" 


    it "should use the passed in objects :email method if not a string" 


    it "should give correct failure message when the email is not set to deliver to the specified address" 


  end

  describe "#deliver_from" do
    it "should match when the email is set to deliver from the specified address" 


    it "should match when the email is set to deliver from the specified name and address" 


    it "should not match when the email does not have a sender" 


    it "should not match when the email addresses match but the names do not" 


    it "should not match when the names match but the email addresses do not" 


    it "should not match when the email is not set to deliver from the specified address" 


    it "should give correct failure message when the email is not set to deliver from the specified address" 


  end

  describe "#bcc_to" do

    it "should match when the email is set to deliver to the specidied address" 


    it "should match when a list of emails is exact same as all of the email's recipients" 


    it "should match when an array of emails is exact same as all of the email's recipients" 


    it "should use the passed in objects :email method if not a string" 


  end

  describe "#have_subject" do

    describe "when regexps are used" do

      it "should match when the subject matches regexp" 


      it "should have a helpful description" 


      it "should offer helpful failing messages" 


      it "should offer helpful negative failing messages" 

    end

    describe "when strings are used" do
      it "should match when the subject equals the passed in string exactly" 


      it "should have a helpful description" 


      it "should offer helpful failing messages" 


      it "should offer helpful negative failing messages" 

    end
  end

  describe "#include_email_with_subject" do
    
    describe "when regexps are used" do
      
      it "should match when any email's subject matches passed in regexp" 


      it "should have a helpful description" 


      it "should offer helpful failing messages" 


      it "should offer helpful negative failing messages" 

    end
    
    describe "when strings are used" do
      it "should match when any email's subject equals passed in subject exactly" 

      
      it "should have a helpful description" 

      
      it "should offer helpful failing messages" 

      
      it "should offer helpful negative failing messages" 

    end
  end

  describe "#have_body_text" do
    describe "when regexps are used" do
      it "should match when the body matches regexp" 


      it "should have a helpful description" 


      it "should offer helpful failing messages" 


      it "should offer helpful negative failing messages" 

    end
    
    describe "when strings are used" do
      it "should match when the body includes the text" 

      
      it "should have a helpful description" 

      
      it "should offer helpful failing messages" 

      
      it "should offer helpful negative failing messages" 

    end

    describe "when dealing with multipart messages" do
      it "should look at the html part" 

    end
  end

  describe "#have_header" do
    describe "when regexps are used" do
      it "should match when header matches passed in regexp" 


      it "should have a helpful description" 


      it "should offer helpful failing messages" 


      it "should offer helpful negative failing messages" 

    end
    
    describe "when strings are used" do
      it "should match when header equals passed in value exactly" 

      
      it "should have a helpful description" 

      
      it "should offer helpful failing messages" 

      
      it "should offer helpful negative failing messages" 

    end
  end
end

