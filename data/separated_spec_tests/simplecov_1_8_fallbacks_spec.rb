# frozen_string_literal: true

require "helper"

# Tests that verify that on 1.8 versions of ruby, simplecov simply
# does not launch and does not cause errors on the way
#
# TODO: This should be expanded upon all methods that could potentially
# be called in a test/spec-helper simplecov config block
#
if RUBY_VERSION.start_with? "1.8"
  describe "Ruby 1.8 fallback" do
    it "return false when calling SimpleCov.start" 


    it "return false when calling SimpleCov.start with a block" 


    it "return false when calling SimpleCov.configure with a block" 


    it "allow to define a profile" 

  end
end

