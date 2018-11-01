require "spec_helper"

module Refinery
  module Pages
    describe SectionPresenter do
      it "can build a css class for when it is not present based on id" 


      it "allows access to constructor arguments" 


      it "should be visible if not hidden" 


      it "should be not visible if hidden" 


      describe "when building html for a section" do
        before do
          @errors = StringIO.new
          @old_err = $stderr
          $stderr = @errors
        end

        after(:each) { $stderr = @old_err }

        it "wont show a hidden section" 


        it "can be hidden with the hide method" 


        it "will use the specified id" 


        # Regression tests for https://github.com/refinery/refinerycms-inquiries/issues/168
        describe "#whitelist_elements" do
          context "when an element is not in a whitelist" do
            it "will not return those elements" 

          end

          context "when an extra element is included in the whitelist" do
            it "will contain the whitelisted element" 

          end
        end

        describe "#whitelist_attributes" do
          context "when an attribute is not in a whitelist" do
            it "will not return those attributes" 

          end

          context "when extra attributes are included in the whitelist" do
            it "will contain the whitelisted attributes" 

          end

          context 'data attributes' do
            it 'all data attributes passed thru' 

          end
        end

        describe "#sanitize_content" do
          let(:warning) do
            %Q{\n-- SANITIZED CONTENT WARNING --\nRefinery::Pages::SectionPresenter#wrap_content_in_tag\nHTML attributes and/or elements content has been sanitized\n\e[31m-<dummy></dummy>\e[0m\n\\ No newline at end of file\n\n}
          end

          it "shows a sanitized content warning" 


          it "accepts a custom logger" 

        end

        describe "if allowed to use fallback html" do
          it "wont show a section with no fallback or override" 


          it "uses wrapped fallback html" 


          it "uses wrapped override html if present" 

        end

        describe "if not allowed to use fallback html" do
          it "wont show a section with no override" 


          it "uses wrapped override html if present" 

        end
      end
    end
  end
end

