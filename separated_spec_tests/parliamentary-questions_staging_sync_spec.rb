require 'spec_helper'

describe RakeTaskHelpers::StagingSync do
  before(:each) do
    ENV['TEST_USER_PASS']='xxx'
    allow($stdout).to receive(:puts)
    ENV['TEST_USER_PASS'] = 'xxxx'
  end

  it 'should not run unless the host env is staging ' 


  it 'should sanitize the db and create test users on staging' 


  it 'should send an email notification in case of failure' 

end

