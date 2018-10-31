require 'spec_helper'

describe WebMock::RequestExecutionVerifier do
  before(:each) do
    @verifier = WebMock::RequestExecutionVerifier.new
    @request_pattern = double(WebMock::RequestPattern, to_s: "www.example.com")
    @verifier.request_pattern = @request_pattern
    allow(WebMock::RequestRegistry.instance).to receive(:to_s).and_return("executed requests")
    @executed_requests_info = "\n\nThe following requests were made:\n\nexecuted requests\n" + "="*60
  end

  describe "description" do

    it "reports the description" 


    it "reports description correctly when expectation is 1 time" 


    context "at_least_times_executed is set" do
      it "reports description correctly when expectation at least 2 times" 


      it "reports description correctly when expectation is at least 3 times" 

    end

    context "at_most_times_executed is set" do
      it "reports description correctly when expectation is at most 2 times" 


      it "reports description correctly when expectation is at most 1 time" 

    end

  end

  describe "failure message" do

    it "reports the failure message" 


    it "reports failure message correctly when executed times is one" 


    context "at_least_times_executed is set" do
      it "reports failure message correctly when executed times is one" 


      it "reports failure message correctly when executed times is two" 

    end

    context "at_most_times_executed is set" do
      it "reports failure message correctly when executed times is three" 


      it "reports failure message correctly when executed times is two" 

    end
  end

  describe "negative failure message" do

    it "reports failure message if it executed number of times specified" 


    it "reports failure message when not expected request but it executed" 


    context "at_least_times_executed is set" do
      it "reports failure message correctly when executed times is one" 


      it "reports failure message correctly when executed times is two" 

    end

    context "at_most_times_executed is set" do
      it "reports failure message correctly when executed times is three" 


      it "reports failure message correctly when executed times is one" 

    end

  end

  describe "matches?" do

    it "succeeds if request was executed expected number of times" 


    it "fails if request was not executed expected number of times" 


  end

  describe "does_not_match?" do

    it "fails if request executed expected number of times" 


    it "succeeds if request was not executed at all and expected number of times was not set" 


    it "fails if request was executed and expected number of times was not set" 


    it "succeeds if request was not executed expected number of times" 


  end

end

