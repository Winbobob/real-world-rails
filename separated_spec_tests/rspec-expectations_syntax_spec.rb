module RSpec
  module Expectations
    RSpec.describe Syntax do
      context "when passing a message to an expectation" do
        let(:warner) { ::Kernel }

        let(:string_like_object) do
          Struct.new(:to_str, :to_s).new(*(["Ceci n'est pas une Chaine."]*2))
        end

        let(:insufficiently_string_like_object) do
          Struct.new(:to_s).new("Ceci n'est pas une Chaine.")
        end

        let(:callable_object) do
          Struct.new(:call).new("Ceci n'est pas une Chaine.")
        end

        describe "expect(...).to" do
          it "prints a warning when the message object isn't a String" 


          it "doesn't print a warning when message is a String" 


          it "doesn't print a warning when message responds to to_str" 


          it "prints a warning when the message object handles to_s but not to_str" 


          it "doesn't print a warning when message responds to call" 

        end

        describe "expect(...).not_to" do
          it "prints a warning when the message object isn't a String" 


          it "doesn't print a warning when message is a String" 


          it "doesn't print a warning when message responds to to_str" 


          it "prints a warning when the message object handles to_s but not to_str" 


          it "doesn't print a warning when message responds to call" 

        end
      end

      describe "enabling the should syntax on something other than the default syntax host" do
        include_context "with the default expectation syntax"

        it "continues to warn about the should syntax" 

      end
    end
  end

  RSpec.describe Expectations do
    it "does not inadvertently define BasicObject on 1.8", :if => RUBY_VERSION.to_f < 1.9 do
      expect(defined?(::BasicObject)).to be nil
    end
  end
end

