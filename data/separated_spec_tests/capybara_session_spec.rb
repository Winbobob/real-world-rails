# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Capybara::Session do
  context "#new" do
    it "should raise an error if passed non-existent driver" 


    it "verifies a passed app is a rack app" 

  end

  context "current_driver" do
    around do |example|
      orig_driver = Capybara.current_driver
      example.run
      Capybara.current_driver = orig_driver
    end

    it "is global when threadsafe false" 


    it "is thread specific threadsafe true" 

  end

  context "session_name" do
    around do |example|
      orig_name = Capybara.session_name
      example.run
      Capybara.session_name = orig_name
    end

    it "is global when threadsafe false" 


    it "is thread specific when threadsafe true" 

  end
end

