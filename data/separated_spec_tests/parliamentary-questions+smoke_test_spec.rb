require 'spec_helper'

describe SmokeTest do
  before(:each) do
    ENV['TEST_USER']      = 'me'
    ENV['TEST_USER_PASS'] = '123'

    allow(Settings).to receive(:live_url).and_return('http://localhost')
  end

  it '#factory - creates an array of all smoke tests' 


  context 'Base' do
    let(:test) { SmokeTest::Base.from_env}

    it '#from_env - should create an instance based on environment variables' 


    it '#passed? - logs into the application and calls all_checks_succeed?' 


    it '#passed? - returns false if an error is raised' 

  end
end

