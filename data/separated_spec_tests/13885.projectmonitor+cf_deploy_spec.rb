require 'spec_helper'

describe CF_deploy do

  describe 'basic argument validation' do
    it 'should terminate if the user does not enter a deployment environment name' 

  end

  describe 'confirming user input for build' do

    default_output_string = "Are you sure you want to deploy to project-monitor-production? (y/n)\n"
    exit_output_string = default_output_string + "exiting\n"

    it 'should move on if the user types "y"' 


    it 'should end if the user types "n"' 


    it 'should repeat if the user types anything else' 

  end


  describe 'authenticating with CloudFoundry' do
    it 'should prompt the user for a username and password and authenticate with those inputs' 

  end

  describe 'tagging git commits' do
    it 'should tag the most recent git commit with a unique message' 

  end
end

