# frozen_string_literal: true

require 'spec_helper'
require 'capybara/dsl'

class TestClass
  include Capybara::DSL
end

Capybara::SpecHelper.run_specs TestClass.new, "DSL", capybara_skip: %i[
  js modals screenshot frames windows send_keys server hover about_scheme psc
]

RSpec.describe Capybara::DSL do
  after do
    Capybara.session_name = nil
    Capybara.default_driver = nil
    Capybara.javascript_driver = nil
    Capybara.use_default_driver
    Capybara.app = TestApp
  end

  describe '#default_driver' do
    it "should default to rack_test" 


    it "should be changeable" 

  end

  describe '#current_driver' do
    it "should default to the default driver" 


    it "should be changeable" 

  end

  describe '#javascript_driver' do
    it "should default to selenium" 


    it "should be changeable" 

  end

  describe '#use_default_driver' do
    it "should restore the default driver" 

  end

  describe '#using_driver' do
    before do
      expect(Capybara.current_driver).not_to eq(:selenium) # rubocop:disable RSpec/ExpectInHook
    end

    it 'should set the driver using Capybara.current_driver=' 


    it 'should return the driver to default if it has not been changed' 


    it 'should reset the driver even if an exception occurs' 


    it 'should return the driver to what it was previously' 


    it 'should yield the passed block' 

  end

  describe '#using_wait_time' do
    before do
      @previous_wait_time = Capybara.default_max_wait_time
    end

    after do
      Capybara.default_max_wait_time = @previous_wait_time
    end

    it "should switch the wait time and switch it back" 


    it "should ensure wait time is reset" 

  end

  describe '#app' do
    it "should be changeable" 

  end

  describe '#current_session' do
    it "should choose a session object of the current driver type" 


    it "should use #app as the application" 


    it "should change with the current driver" 


    it "should be persistent even across driver changes" 


    it "should change when changing application" 


    it "should change when the session name changes" 

  end

  describe "#using_session" do
    it "should change the session name for the duration of the block" 


    it "should reset the session to the default, even if an exception occurs" 


    it "should yield the passed block" 


    it "should be nestable" 

  end

  describe "#session_name" do
    it "should default to :default" 

  end

  describe 'the DSL' do
    before do
      @session = Class.new { include Capybara::DSL }.new
    end

    it "should be possible to include it in another class" 


    it "should provide a 'page' shortcut for more expressive tests" 


    it "should provide an 'using_session' shortcut" 


    it "should provide a 'using_wait_time' shortcut" 

  end
end

