module RSpec
  module Matchers
    RSpec.describe Composable do
      RSpec::Matchers.define :matcher_using_surface_descriptions_in do |expected|
        match { false }
        failure_message { surface_descriptions_in(expected).to_s }
      end

      it "does not blow up when surfacing descriptions from an unreadable IO object" 


      it "does not blow up when surfacing descriptions from an unreadable Range object" 


      it "does not blow up when surfacing descriptions from an Enumerable object whose #each includes the object itself" 


      it "does not enumerate normal ranges" 


      it "doesn't mangle struct descriptions" 


      RSpec::Matchers.define :all_but_one do |matcher|
        match do |actual|
          match_count = actual.count { |v| values_match?(matcher, v) }
          actual.size == match_count + 1
        end
      end

      context "when using a matcher instance that memoizes state multiple times in a composed expression" do
        it "works properly in spite of the memoization" 


        context "when passing a compound expression" do
          it "works properly in spite of the memoization" 

        end
      end

      describe "cloning data structures containing matchers" do
        include Composable

        it "clones only the contained matchers" 


        it "copies custom matchers properly so they can work even though they have singleton behavior" 


        it 'does not blow up when passed an array containing an IO object' 

      end
    end
  end
end

