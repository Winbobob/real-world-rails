require 'spec_helper'

describe SmokeTestRunner do
  let(:f)        { double File }
  let(:out_file) { "#{Rails.root}#{Settings.smoke_test_runner.out_file}" }

  before(:each) do
    ENV['TEST_USER']      = 'me'
    ENV['TEST_USER_PASS'] = '123'

    allow(Settings).to receive(:live_url).and_return('http://localhost')
  end

  it '#run! - runs the test suite and records result to file' 


  it '#run_time - returns the timestamp of the last run' 


  it '#run_success? - returns whether the last run was successful' 

end

