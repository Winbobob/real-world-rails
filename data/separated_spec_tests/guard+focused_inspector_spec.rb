require "guard/compat/test/helper"

require "lib/guard/rspec/inspectors/shared_examples"

require "guard/rspec/inspectors/focused_inspector"

klass = Guard::RSpec::Inspectors::FocusedInspector

RSpec.describe klass do
  include_examples "inspector", klass

  # Use real paths because BaseInspector#_clean will be used to clean them
  let(:other_paths) do
    [
      "spec/lib/guard/rspec/inspectors/simple_inspector_spec.rb",
      "spec/lib/guard/rspec/runner_spec.rb"
    ]
  end

  let(:other_failed_locations) do
    %w(./spec/lib/guard/rspec/deprecator_spec.rb:446)
  end

  it "remembers failed paths and returns them until they all pass" 


  describe "#reload" do
    it "force to forget about focused locations" 

  end
end

