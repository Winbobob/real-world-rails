require 'spec_helper'

# http://blog.davidchelimsky.net/articles/2007/06/03/oxymoron-testing-behaviour-of-abstractions
describe Radiant::ApplicationController do

  it 'should include LoginSystem' 


  it 'should initialize detail' 


  it 'should initialize the javascript and stylesheets arrays' 


  it "should include stylesheets" 


  it "should include javascripts" 


  describe 'self.template_name' do
    it "should return 'index' when the controller action_name is 'index'" 

    ['new', 'create'].each do |action|
      it "should return 'new' when the action_name is #{action}" 

    end
    ['edit', 'update'].each do |action|
      it "should return 'edit' when the action_name is #{action}" 

    end
    ['remove', 'destroy'].each do |action|
      it "should return 'remove' when the action_name is #{action}" 

    end
    it "should return 'show' when the action_name is show" 

    it "should return the action_name when the action_name is a non-standard name" 

  end

  describe "set_timezone" do
    it "should use Radiant::Config['local.timezone']" 


    it "should default to config.time_zone" 

  end
end

