require 'spec_helper'
require "#{Rails.root}/lib/rake_task_helpers/test_user_generator.rb"

describe RakeTaskHelpers::TestUserGenerator do
  let(:path) { "#{Rails.root}/spec/lib/rake_task_helpers/sample_config.yml" } 
  let(:gen)  { RakeTaskHelpers::TestUserGenerator.from_config(path)         }

  before(:each) do
    ENV['TEST_USER_PASS'] = 'password'
  end

  it 'should load data from the provided config file' 


  it 'should create the records for a tester in the database' 


  it 'should raise an error if the TEST_USER_PASS env variable is not set' 

end

