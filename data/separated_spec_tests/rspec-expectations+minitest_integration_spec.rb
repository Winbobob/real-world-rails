module RSpec
  RSpec.describe Matchers do

    let(:sample_matchers) do
      [:be,
       :be_instance_of,
       :be_kind_of]
    end

    context "once required", :slow do
      include MinitestIntegration

      it "includes itself in Minitest::Test, and sets up our exceptions to be counted as assertion failures" 


    end

  end
end

