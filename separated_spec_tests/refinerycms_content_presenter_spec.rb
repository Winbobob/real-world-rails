require "spec_helper"

module Refinery
  module Pages
    describe ContentPresenter do
      let(:section1) { double(SectionPresenter, :id => 'foo', :has_content? => true) }
      let(:section2) { double(SectionPresenter, :id => 'bar', :has_content? => true) }

      describe "when building css classes for blank sections" do
        let(:section) { double(SectionPresenter, :not_present_css_class => 'no_section1') }

        it "includes css class for any section which doesnt have content" 


        it "doesnt include sections which have content" 

      end

      describe "when hiding sections" do
        before do
          @content = ContentPresenter.new
          @content.add_section section1
          @content.add_section section2
        end

        it "hides a section specified by id" 


        # Regression for https://github.com/refinery/refinerycms/issues/1516
        it "accepts an array" 


        it "hides nothing if nil" 


      end

      describe "when fetching template overrides" do
        before do
          @content = ContentPresenter.new
        end

        it "yields a section with an id and stores the result in its override html" 


        it "doesnt yield a section without an id" 

      end

      describe "when rendering as html" do
        it "is empty section tag if it has no sections" 


        it "returns sections joined by a newline inside section tag" 


        it "passes can_use_fallback option on to sections" 


        it "doesnt include sections with nil content" 

      end
    end
  end
end

