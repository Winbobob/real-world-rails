# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe "authenticated data store" do

  before(:each) do
    @env = env_with_params
    @env['rack.session'] = {
      "warden.user.foo.key"     => "foo user",
      "warden.user.default.key" => "default user",
      :foo => "bar"
    }
  end

  it "should store data for the default scope" 


  it "should store data for the foo user" 


  it "should store the data separately" 


  it "should clear the foo scoped data when foo logs out" 


  it "should clear out the default data when :default logs out" 


  it "should clear out all data when a general logout is performed" 


  it "should logout multiple persons at once" 


  it "should not store data for a user who is not logged in" 

end

