module RSpec
  module Matchers
    RSpec.describe EnglishPhrasing do
      describe ".split_words" do
        it "replaces underscores with spaces" 


        it "first casts its argument to string" 

      end

      describe ".list" do
        context "given nil" do
          it "returns value from inspect, and a leading space" 

        end

        context "given a Struct" do
          it "returns value from inspect, and a leading space" 

        end

        context "given an Enumerable" do
          before do
            allow(RSpec::Support::ObjectFormatter).to(
              receive(:format).and_return("Banana")
            )
          end

          context "with zero items" do
            it "returns the empty string" 

          end

          context "with one item" do
            let(:list) { [double] }
            it "returns description, and a leading space" 

          end

          context "with two items" do
            let(:list) { [double, double] }
            it "returns descriptions, and a leading space" 

          end

          context "with three items" do
            let(:list) { [double, double, double] }
            it "returns descriptions, and a leading space" 

          end
        end
      end
    end
  end
end

