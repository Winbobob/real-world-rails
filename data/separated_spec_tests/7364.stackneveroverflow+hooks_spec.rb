# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe "standard authentication hooks" do

  before(:all) do
    load_strategies
  end

  describe "after_set_user" do
    before(:each) do
      RAM = Warden::Manager unless defined?(RAM)
      RAM._after_set_user.clear
    end

    after(:each) do
      RAM._after_set_user.clear
    end

    it "should allow me to add an after_set_user hook" 


    it "should allow me to add multiple after_set_user hooks" 


    it "should run each after_set_user hook after the user is set" 


    it "should not run the event specified with except" 


    it "should only run the event specified with only" 


    it "should run filters in the given order" 


    context "after_authentication" do
      it "should be a wrapper to after_set_user behavior" 


      it "should not be invoked on default after_set_user scenario" 


      it "should run filters in the given order" 


      it "should allow me to log out a user in an after_set_user block" 

    end

    context "after_fetch" do
      it "should be a wrapper to after_set_user behavior" 


      it "should not be invoked on default after_set_user scenario" 


      it "should not be invoked if fetched user is nil" 


      it "should run filters in the given order" 

    end
  end


  describe "after_failed_fetch" do
    before(:each) do
      RAM = Warden::Manager unless defined?(RAM)
      RAM._after_failed_fetch.clear
    end

    after(:each) do
      RAM._after_failed_fetch.clear
    end

    it "should not be called when user is fetched" 


    it "should be called if fetched user is nil" 

  end

  describe "before_failure" do
    before(:each) do
      RAM = Warden::Manager unless defined?(RAM)
      RAM._before_failure.clear
    end

    after(:each) do
      RAM._before_failure.clear
    end

    it "should allow me to add a before_failure hook" 


    it "should allow me to add multiple before_failure hooks" 


    it "should run each before_failure hooks before failing" 


    it "should run filters in the given order" 

  end

  describe "before_logout" do
    before(:each) do
      RAM = Warden::Manager unless defined?(RAM)
      RAM._before_logout.clear
    end

    after(:each) do
      RAM._before_logout.clear
    end

    it "should allow me to add an before_logout hook" 


    it "should allow me to add multiple after_authentication hooks" 


    it "should run each before_logout hook before logout is run" 


    it "should run before_logout hook for a specified scope" 


    it "should run filters in the given order" 

  end

  describe "on_request" do
    before(:each) do
      RAM = Warden::Manager unless defined?(RAM)
      @old_on_request = RAM._on_request.dup
      RAM._on_request.clear
    end

    after(:each) do
      RAM._on_request.clear
      RAM._on_request.replace(@old_on_request)
    end

    it "should allow me to add an on_request hook" 


    it "should allow me to add multiple on_request hooks" 


    it "should run each on_request hooks when initializing" 


    it "should run filters in the given order" 

  end
end

