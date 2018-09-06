RSpec.describe "Aggregating failures" do
  shared_examples_for "failure aggregation" do |exception_attribute, example_meta|
    context "via the `aggregate_failures` method" do
      context 'when the example has an expectation failure, plus an `after` hook and an `around` hook failure' do
        it 'presents a flat list of three failures' 

      end

      context 'when the example has multiple expectation failures, plus an `after` hook and an `around` hook failure' do
        it 'nests the expectation failures so that they can be labeled with the aggregation block label' 

      end
    end

    context "via `:aggregate_failures` metadata" do
      it 'applies `aggregate_failures` to examples or groups tagged with `:aggregate_failures`' 


      context 'when the example has an exception, plus another error' do
        it 'reports it as a multiple exception error' 

      end

      context 'when the example has multiple exceptions, plus another error' do
        it 'reports it as a flat multiple exception error' 

      end
    end
  end

  context "for a non-pending example" do
    include_examples "failure aggregation", :exception, {}

    it 'does not interfere with other `around` hooks' 
            it "has multiple failures" 

          end
        end
      end.run

      expect(events).to eq([:outer_before, :inner_before, :example_before,
                            :example_after, :inner_after, :outer_after])
    end
  end

  context "for a pending example" do
    include_examples "failure aggregation", :pending_exception, :pending => true
  end
end

