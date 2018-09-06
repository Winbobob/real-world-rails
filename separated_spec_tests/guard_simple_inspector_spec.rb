require "guard/compat/test/helper"

require "lib/guard/rspec/inspectors/shared_examples"

require "guard/rspec/inspectors/simple_inspector"

klass = Guard::RSpec::Inspectors::SimpleInspector

RSpec.describe klass do
  include_examples "inspector", klass

  # Use real paths because BaseInspector#_clean will be used to clean them
  let(:other_paths) do
    [
      "spec/lib/guard/rspec/inspectors/simple_inspector_spec.rb",
      "spec/lib/guard/rspec/runner_spec.rb"
    ]
  end

  it "returns paths and do not bothers about failed locations" 

end

