RSpec.describe "rspec warnings and deprecations" do

  describe "#deprecate" do
    it "passes the hash to the reporter" 


    it "adds the call site" 


    it "doesn't override a passed call site" 

  end

  describe "#warn_deprecation" do
    it "puts message in a hash" 


    it "passes along additional options" 

  end

  describe "#warn_with" do
    context "when :use_spec_location_as_call_site => true is passed" do
      let(:options) do
        {
          :use_spec_location_as_call_site => true,
          :call_site                      => nil,
        }
      end

      it "adds the source location of spec" 


      it "appends a period to the supplied message if one is not present" 


      context "when there is no current example" do
        before do
          allow(RSpec).to receive(:current_example).and_return(nil)
        end

        it "adds no message about the spec location" 

      end
    end
  end
end

