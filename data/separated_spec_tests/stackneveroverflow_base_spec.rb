# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe Warden::Strategies::Base do

  before(:each) do
    RAS = Warden::Strategies unless defined?(RAS)
    Warden::Strategies.clear!
  end

  describe "headers" do
    it "should have headers" 


    it "should allow us to clear the headers" 

  end

  it "should have a user object" 


  it "should be performed after run" 


  it "should set the scope" 


  it "should allow you to set a message" 


  it "should provide access to the errors" 


  describe "halting" do
    it "should allow you to halt a strategy" 


    it "should not be halted if halt was not called" 


  end

  describe "pass" do
    it "should allow you to pass" 

  end

  describe "redirect" do
    it "should allow you to set a redirection" 


    it "should mark the strategy as halted when redirecting" 


    it "should escape redirected url parameters" 


    it "should allow you to set a message" 


    it "should set the action as :redirect" 

  end

  describe "failure" do

    before(:each) do
      RAS.add(:hard_fail) do
        def authenticate!
          fail!("You are not cool enough")
        end
      end

      RAS.add(:soft_fail) do
        def authenticate!
          fail("You are too soft")
        end
      end
      @hard = RAS[:hard_fail].new(env_with_params)
      @soft = RAS[:soft_fail].new(env_with_params)
    end

    it "should allow you to fail hard" 


    it "should halt the strategies when failing hard" 


    it "should allow you to set a message when failing hard" 


    it "should set the action as :failure when failing hard" 


    it "should allow you to fail soft" 


    it "should not halt the strategies when failing soft" 


    it "should allow you to set a message when failing soft" 


    it "should set the action as :failure when failing soft" 

  end

  describe "success" do
    before(:each) do
      RAS.add(:foobar) do
        def authenticate!
          success!("Foo User", "Welcome to the club!")
        end
      end
      @str = RAS[:foobar].new(env_with_params)
    end

    it "should allow you to succeed" 


    it "should be authenticated after success" 


    it "should allow you to set a message when succeeding" 


    it "should store the user" 


    it "should set the action as :success" 

  end

  describe "custom response" do
    before(:each) do
      RAS.add(:foobar) do
        def authenticate!
          custom!([521, {"foo" => "bar"}, ["BAD"]])
        end
      end
      @str = RAS[:foobar].new(env_with_params)
      @str._run!
    end

    it "should allow me to set a custom rack response" 


    it "should halt the strategy" 


    it "should provide access to the custom rack response" 


    it "should set the action as :custom" 

  end

end

