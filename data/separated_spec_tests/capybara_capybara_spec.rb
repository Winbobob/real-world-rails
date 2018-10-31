# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Capybara do
  describe 'default_max_wait_time' do
    after do
      Capybara.default_max_wait_time = @previous_default_time
    end

    it "should be changeable" 

  end

  describe '.register_driver' do
    it "should add a new driver" 

  end

  describe '.register_server' do
    it "should add a new server" 

  end

  describe ".server" do
    after do
      Capybara.server = :default
    end

    it "should default to a proc that calls run_default_server" 


    it "should return a custom server proc" 


    it "should have :webrick registered" 


    it "should have :puma registered" 

  end

  describe "server=" do
    after do
      Capybara.server = :default
    end

    it "accepts a proc" 

  end

  describe 'app_host' do
    after do
      Capybara.app_host = nil
    end

    it "should warn if not a valid URL" 


    it "should not warn if a valid URL" 


    it "should not warn if nil" 

  end

  describe 'default_host' do
    around do |test|
      old_default = Capybara.default_host
      test.run
      Capybara.default_host = old_default
    end

    it "should raise if not a valid URL" 


    it "should not warn if a valid URL" 

  end
end

