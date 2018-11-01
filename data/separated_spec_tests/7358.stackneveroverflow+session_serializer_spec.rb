# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe Warden::SessionSerializer do
  before(:each) do
    @env = env_with_params
    @env['rack.session'] ||= {}
    @session = Warden::SessionSerializer.new(@env)
  end

  it "should store data for the default scope" 


  it "should check if a data is stored or not" 


  it "should load an user from store" 


  it "should store data based on the scope" 


  it "should delete data from store" 


  it "should delete information from store if user cannot be retrieved" 


  it "should support a nil session store" 

end

