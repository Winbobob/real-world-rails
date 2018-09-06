module RSpec
  module Mocks
    RSpec.describe "a double stubbed with multiple return values" do
      let(:a_double) { double }

      before do
        allow(a_double).to receive(:foo).and_return(:val_1, nil)
      end

      it 'can still set a message expectation with a single return value' 

    end

    RSpec.describe "a message expectation with multiple return values and no specified count" do
      before(:each) do
        @double = double
        @return_values = [1, 2, 3]
        expect(@double).to receive(:do_something).and_return(@return_values[0], @return_values[1], @return_values[2])
      end

      it "returns values in order" 


      it "falls back to a previously stubbed value" 


      it "fails when there are too few calls (if there is no stub)" 


      it "fails when there are too many calls (if there is no stub)" 

    end

    RSpec.describe "a message expectation with multiple return values with a specified count equal to the number of values" do
      before(:each) do
        @double = double
        @return_values = [1, 2, 3]
        expect(@double).to receive(:do_something).exactly(3).times.and_return(@return_values[0], @return_values[1], @return_values[2])
      end

      it "returns values in order to consecutive calls" 

    end

    RSpec.describe "a message expectation with multiple return values specifying at_least less than the number of values" do
      before(:each) do
        @double = double
        expect(@double).to receive(:do_something).at_least(:twice).with(no_args).and_return(11, 22)
      end

      it "uses the last return value for subsequent calls" 


      it "fails when called less than the specified number" 


      context "when method is stubbed too" do
        before { allow(@double).to receive(:do_something).and_return :stub_result }

        it "uses the last value for subsequent calls" 


        it "fails when called less than the specified number" 

      end
    end

    RSpec.describe "a message expectation with multiple return values with a specified count larger than the number of values" do
      before(:each) do
        @double = RSpec::Mocks::Double.new("double")
        expect(@double).to receive(:do_something).exactly(3).times.and_return(11, 22)
      end

      it "uses the last return value for subsequent calls" 


      it "fails when called less than the specified number" 


      it "fails fast when called greater than the specified number" 

    end
  end
end

