RSpec.describe "an example" do
  context "declared pending with metadata" do
    it "uses the value assigned to :pending as the message" 


    it "sets the message to 'No reason given' if :pending => true" 


    it "passes if a mock expectation is not satisifed" 


    it "does not mutate the :pending attribute of the user metadata when handling mock expectation errors" 

  end

  context "made pending with `define_derived_metadata`" do
    before do
      RSpec.configure do |config|
        config.define_derived_metadata(:not_ready) do |meta|
          meta[:pending] ||= "Not ready"
        end
      end
    end

    it 'has a pending result if there is an error' 


    it 'fails if there is no error' 

  end

  context "with no block" do
    it "is listed as pending with 'Not yet implemented'" 

  end

  context "with no args" do
    it "is listed as pending with the default message" 
        it "does something" 

      end
      example = group.examples.first
      example.run(group.new, double.as_null_object)
      expect(example).to be_pending_with(RSpec::Core::Pending::NO_REASON_GIVEN)
    end

    it "fails when the rest of the example passes" 
        it "does something" 

      end

      example = group.examples.first
      example.run(group.new, double.as_null_object)
      expect(called).to eq(true)
      result = example.execution_result
      expect(result.pending_fixed).to eq(true)
      expect(result.status).to eq(:failed)
    end

    it "does not mutate the :pending attribute of the user metadata when the rest of the example passes" 
        it "does something" 

      end

      group.run
      example = group.examples.first
      expect(example.metadata).to include(:pending => true)
    end
  end

  context "with no docstring" do
    context "declared with the pending method" do
      it "has an auto-generated description if it has an expectation" 
          it "checks something" 

          ex = pending do
            expect("string".reverse).to eq("gnirts")
          end
        end.run

        expect(ex.description).to eq('should eq "gnirts"')
      end
    end

    context "after another example with some assertion" do
      it "does not show any message" 
          it "checks something" 

          ex = specify do
            pending
          end
        end.run

        expect(ex.description).to match(/example at/)
      end
    end
  end

  context "with a message" do
    it "is listed as pending with the supplied message" 
        it "does something" 

      end
      example = group.examples.first
      example.run(group.new, double.as_null_object)
      expect(example).to be_pending_with('just because')
    end
  end

  context "with a block" do
    it "fails with an ArgumentError stating the syntax is deprecated" 
        it "calls pending with a block" 

      end
      example = group.examples.first
      group.run
      expect(example).to fail_with ArgumentError
      expect(example.exception.message).to match(
        /Passing a block within an example is now deprecated./
      )
    end

    it "does not yield to the block" 
        it "calls pending with a block" 

      end
      group.run
      expect(example_to_have_yielded).to eq :did_not_yield
    end
  end
end

