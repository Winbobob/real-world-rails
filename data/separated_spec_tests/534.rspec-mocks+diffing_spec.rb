require "spec_helper"
require "pp"

RSpec.describe "Diffs printed when arguments don't match" do
  before do
    allow(RSpec::Mocks.configuration).to receive(:color?).and_return(false)
  end

  context "with a non matcher object" do
    it "does not print a diff when single line arguments are mismatched" 


    it "does not print a diff when differ returns a string of only whitespace" 


    it "prints a diff of the strings for individual mismatched multi-line string arguments" 


    it "prints a diff of the args lists for multiple mismatched string arguments" 


    it "does not print a diff when multiple single-line string arguments are mismatched" 


    let(:expected_hash) { {:baz => :quz, :foo => :bar } }

    let(:actual_hash) { {:bad => :hash} }

    it "prints a diff with hash args" 


    it "prints a diff with an expected hash arg and a non-hash actual arg" 


    if RUBY_VERSION.to_f < 1.9
      # Ruby 1.8 hashes are not ordered, but `#inspect` on a particular unchanged
      # hash instance should return consistent output. However, on Travis that does
      # not always seem to be true and we have no idea why. Somehow, the travis build
      # has occasionally failed due to the output ordering varying between `inspect`
      # calls to the same hash. This regex allows us to work around that.
      def hash_regex_inspect(hash)
        "\\{(#{hash.map { |key, value| "#{key.inspect}=>#{value.inspect}.*" }.join "|"}){#{hash.size}}\\}"
      end
    else
      def hash_regex_inspect(hash)
        Regexp.escape(hash.inspect)
      end
    end

    it "prints a diff with array args" 


    context "that defines #description" do
      it "does not use the object's description for a non-matcher object that implements #description" 

    end
  end

  context "with a matcher object" do
    context "that defines #description" do
      it "uses the object's description" 

    end

    context "that does not define #description" do
      it "for a matcher object that does not implement #description" 

    end
  end
end

