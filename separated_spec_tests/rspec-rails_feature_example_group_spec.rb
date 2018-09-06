require "spec_helper"

module RSpec::Rails
  describe FeatureExampleGroup do
    it_behaves_like "an rspec-rails example group mixin", :feature,
      './spec/features/', '.\\spec\\features\\'

    it "includes Rails route helpers" 


    describe "#visit" do
      it "raises an error informing about missing Capybara" 


      it "is resistant to load order errors" 

    end
  end
end

