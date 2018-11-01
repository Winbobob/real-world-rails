require "spec_helper"

module RSpec
  module Support
    RSpec.describe "matcher definitions" do
      RSpec::Matchers.define :fake_matcher do |expected|
        match { |actual| expected == actual }
        description { :fake_matcher }
      end

      RSpec::Matchers.define :matcher_with_no_description do
        match { true }
        undef description
      end

      describe ".rspec_description_for_object" do
        it "returns the object for a non matcher object" 


        it "returns the object's description for a matcher object that has a description" 


        it "returns the object for a matcher that does not have a description" 

      end
    end
  end
end

